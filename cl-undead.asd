;;;; cl-undead.asd

(asdf:defsystem #:cl-undead
  :serial t
  :depends-on (#:closure-html
               #:cl-ppcre
               #:drakma)
  :components ((:module "src"
                        :components ((:file "package")
                                     (:file "cl-undead"
                                            :depends-on ("package"))))))

(defmethod perform ((o asdf:test-op) (c (eql (asdf:find-system :cl-undead))))
  (funcall (intern "RUN!" :5am)
           (intern "MAIN" :cl-undead-test)))
