(asdf:defsystem :pz-godot
  :description "Bindings to Godot game engine"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:pz-godot-bindings))


(asdf:defsystem :pz-godot/wrapper
  :description "ClAW wrapper over Godot game engine"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :cffi :claw :claw-utils)
  :serial t
  :components ((:file "src/claw")
               (:module :wrapper-includes :pathname "src/lib/include/")
               (:module :godot-extension-includes :pathname "src/lib/godot/core/extension/")))


(asdf:defsystem :pz-godot/example
  :description "PZ-GODOT example"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:float-features :cffi :pz-godot :cffi-c-ref)
  :serial t
  :pathname "example/"
  :components ((:file "example")))
