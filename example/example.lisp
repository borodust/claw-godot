(cl:defpackage :godot.example
  (:use :cl)
  (:local-nicknames (:cref :cffi-c-ref))
  (:export #:run))
(cl:in-package :godot.example)


(cffi:define-foreign-library (godot
                              :search-path (asdf:system-relative-pathname :pz-godot/wrapper "src/lib/build/desktop/library/"))
  (:linux "libgodot.so"))


;; See %gdext:initialize-callback
(cffi:defcallback %init-level-init :void
    ((userdata (claw-utils:claw-pointer :void))
     (init-level %gdext::initialization-level))
  (declare (ignore userdata))
  (format *standard-output* "~&Initializing level: ~A" init-level)
  (values))


;; See %gdext:deinitialize-callback
(cffi:defcallback %init-level-deinit :void
    ((userdata (claw-utils:claw-pointer :void))
     (init-level %gdext::initialization-level))
  (declare (ignore userdata))
  (format *standard-output* "~&Deinitializing level: ~A" init-level)
  (values))


;; See %gdext:initialization-function
(cffi:defcallback %gdext-init :unsigned-char
    ((proc-addr-getter (claw-utils:claw-function-prototype-pointer
                        (claw-utils:claw-function-prototype-pointer :void)
                        claw-utils:claw-string))
     (ext-class-lib (claw-utils:claw-pointer :void))
     (gdext-init-record (claw-utils:claw-pointer (:struct %gdext::initialization))))
  (declare (ignore proc-addr-getter ext-class-lib))
  (format *standard-output* "~&Got in")
  (cref:c-let ((init (:struct %gdext::initialization) :from gdext-init-record))
    (setf (init :minimum-initialization-level) 3
          (init :userdata) nil
          (init :initialize) (cffi:callback %init-level-init)
          (init :deinitialize) (cffi:callback %init-level-deinit)))
  (format *standard-output* "~&Init record prepared")
  1)


(defun handle-instance (godot-instance)
  (format *standard-output* "~&Yay! We have an instance: ~A" godot-instance)
  (finish-output *standard-output*)
  (sleep 15))


(defun run-with-godot-instance ()
  (break)
  (let ((exec-path (namestring
                    (asdf:system-relative-pathname :pz-godot/example "."))))
    (cffi:with-foreign-string (exec-path-ptr exec-path)
      (cffi:with-foreign-object (argv :pointer)
        (setf (cffi:mem-ref argv :pointer) exec-path-ptr)
        (let ((instance (%gdext:create-godot-instance 1 argv (cffi:callback %gdext-init))))
          (if (cffi:null-pointer-p instance)
              (error "Failed to create Godot instance")
              (unwind-protect
                   (handle-instance instance)
                (%gdext:destroy-godot-instance instance))))))))


(defun run ()
  (cffi:load-foreign-library 'godot)
  (unwind-protect
       (float-features:with-float-traps-masked t
         (run-with-godot-instance))
    (cffi:close-foreign-library 'godot)))
