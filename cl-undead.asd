;;;; cl-undead.asd

(asdf:defsystem #:cl-undead
  :serial t
  :depends-on (#:closure-html
               #:cl-ppcre
               #:drakma)
  :components ((:file "package")
               (:file "cl-undead")))

