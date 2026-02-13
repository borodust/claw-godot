(asdf:defsystem :pz-godot
  :description "Bindings to Godot game engine"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:uiop :cffi :pz-godot/common)
  :pathname "bindings/"
  :components ((:file "gdext-types")
               (:file "gdext-interface")
               (:file "libgodot")
               (:file "godot-extensions")
               (:file "epilogue")))


(asdf:defsystem :pz-godot/common
  :description "Bindings to Godot game engine"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:uiop :cffi)
  :pathname "bindings/"
  :components ((:file "gdext-common")))


(asdf:defsystem :pz-godot/wrapper
  :description "ClAW wrapper over Godot game engine"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:uiop :alexandria :cl-ppcre :cffi :com.inuoe.jzon :pz-godot/common)
  :serial t
  :pathname "src/"
  :components ((:file "packages")
               (:file "clawless")))


(asdf:defsystem :pz-godot/example
  :description "PZ-GODOT example"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:float-features :cffi :pz-godot)
  :serial t
  :pathname "example/"
  :components ((:file "example")))
