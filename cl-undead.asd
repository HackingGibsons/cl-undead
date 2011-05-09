;;;; cl-undead.asd

(asdf:defsystem #:cl-undead
  :serial t
  :depends-on (#:closure-html
               #:cl-ppcre
               #:drakma)
  :in-order-to ((test-op (load-op cl-undead-test)))
  :components ((:module "src"
                        :components ((:file "package")
                                     (:file "utils" :depends-on ("package"))

                                     (:file "cl-undead" :depends-on ("utils"))))))

(defmethod perform ((o asdf:test-op) (c (eql (asdf:find-system :cl-undead))))
  (funcall (intern "RUN!" :5am)
           (intern "MAIN" :cl-undead-test)))
