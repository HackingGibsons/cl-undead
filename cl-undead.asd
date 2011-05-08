;;;; cl-undead.asd

(asdf:defsystem #:cl-undead
  :serial t
  :depends-on (#:closure-html
               #:cl-ppcre
               #:drakma)
  :components ((:file "package")
               (:file "cl-undead")))

(defmethod perform ((o asdf:test-op) (c (eql (find-system :cl-undead))))
  (funcall (intern "RUN!" :5am)
           (intern "MAIN" :cl-undead-test)))
