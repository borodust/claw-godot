(cl:defpackage :%gdext.common
  (:use :cl)
  (:export #:wchar
           #:defcfunproto
           #:defprotocallback
           #:funcall-prototype

           #:defifun
           #:initialize-interface

           #:bind-extension))
(cl:defpackage :%%gdext.common~secret
  (:use))
(cl:in-package :%gdext.common)


(defvar *function-prototype-registry* (make-hash-table))

(defvar *interface-registry* (make-hash-table))

(cffi:defctype wchar #+windows :uint16 #-windows :uint32)


(defun format-symbol-into (package control-string &rest args)
  (uiop:intern* (apply #'format nil control-string args) package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FUNCTION PROTO
;;
(defun register-function-prototype (name result-type &rest parameter-types)
  (setf (gethash name *function-prototype-registry*) (list* result-type parameter-types)))


(defmacro defcfunproto (name result-type &body parameter-types)
  `(register-function-prototype ',name ',result-type ,@(loop for type in parameter-types
                                                             collect `(quote ,type) )))


(defmacro funcall-prototype (ptr name &rest args)
  (let* ((proto (gethash name *function-prototype-registry*)))
    (unless proto
      (error "Function prototype for name ~A not found" name))
    (unless (= (length (rest proto)) (length args))
      (error "Unexpected number of arguments: expected ~A, got ~A"
             (length (rest proto))
             (length args)))
    (let ((type-args (reduce #'append (mapcar #'list (rest proto) args))))
      `(cffi:foreign-funcall-pointer ,ptr ()
                                     ,@type-args
                                     ,(first proto)))))


(defmacro defprotocallback (name (&rest args) &body body)
  (destructuring-bind (callback-name &optional prototype-name) (if (listp name) name (list name))
    (let* ((prototype-name (or prototype-name callback-name))
           (proto (gethash prototype-name *function-prototype-registry*)))
      (unless proto
        (error "Function prototype for name ~A not found" prototype-name))
      (unless (= (length (rest proto)) (length args))
        (error "Unexpected number of arguments: expected ~A, got ~A"
               (length (rest proto))
               (length args)))
      (let ((arg-types (mapcar #'list args (rest proto))))
        `(cffi:defcallback ,callback-name ,(first proto) (,@arg-types)
           ,@body)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; INTERFACE FUNC
;;
(defun register-interface-function (lisp-name c-name ptr-var-name)
  (setf (gethash lisp-name *interface-registry*) (cons c-name ptr-var-name)))


(defmacro defifun ((c-name lisp-name) return-type
                   &body parameters)
  (let ((param-names (mapcar #'first parameters))
        (ptr-var-name (format-symbol-into '%%gdext.common~secret "*~A~~~A*" 'function-pointer lisp-name)))
    `(progn
       (eval-when (:compile-toplevel :load-toplevel :execute)
         (defcfunproto ,lisp-name ,return-type ,@(mapcar #'second parameters)))
       (defvar ,ptr-var-name (cffi:null-pointer))
       (defun ,lisp-name (,@param-names)
         (funcall-prototype ,ptr-var-name ,lisp-name ,@param-names))
       (register-interface-function
        ',lisp-name ,c-name ',ptr-var-name))))
