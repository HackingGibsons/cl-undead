(asdf:defsystem #:cl-undead-test
  :depends-on (#:cl-undead #:fiveam)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "utils" :depends-on ("packages"))
                                     (:file "fixtures" :depends-on ("packages"))
                                     (:file "suites" :depends-on ("packages"))))))
