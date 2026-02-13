(cl:in-package :%gdext.common)


(defun initialize-interface (get-proc-address-ptr)
  (flet ((%get-proc-addr (c-name)
           (cffi:with-foreign-string (c-name-ptr c-name :encoding :latin1)
             (funcall-prototype get-proc-address-ptr
                                %gdext.types:interface-get-proc-address
                                c-name-ptr))))
    (loop for (c-name . ptr-var-name) being the hash-value in *interface-registry*
          do (setf (symbol-value ptr-var-name) (%get-proc-addr c-name))))
  (values))


(cffi:defcstruct (string-name :size 8))


(defmacro with-godot-alloc ((var size) &body body)
  `(let ((,var (%gdext.interface:mem-alloc ,size)))
     (unwind-protect
          (progn ,@body)
       (%gdext.interface:mem-free ,var))))


(defmacro with-godot-string-name ((var lisp-string) &body body)
  (let ((string-ptr (gensym)))
    `(with-godot-alloc (,var (cffi:foreign-type-size '(:struct string-name)))
       (cffi:with-foreign-string (,string-ptr ,lisp-string :encoding :utf-8)
         (%gdext.interface:string-name-new-with-utf8-chars ,var ,string-ptr)
         ,@body))))


(defmacro with-godot-string-names (bindings &body body)
  (if bindings
      (destructuring-bind (var lisp-string) (first bindings)
        `(with-godot-string-name (,var ,lisp-string)
           (with-godot-string-names ,(rest bindings)
             ,@body)))
      `(progn ,@body)))


(defun get-method-bind (class-name method-name hash)
  (with-godot-string-names ((class-string-name class-name)
                            (method-string-name method-name))
    (%gdext.interface:classdb-get-method-bind class-string-name
                                              method-string-name
                                              hash)))


(defun call-method-bind (method-bind object)
  (cffi:with-foreign-pointer (ret 256)
    (%gdext.interface:object-method-bind-ptrcall method-bind object
                                                 (cffi:null-pointer)
                                                 ret)))
