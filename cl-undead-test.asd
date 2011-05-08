(asdf:defsystem #:cl-undead-test
  :depends-on (#:cl-undead #:fiveam)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "suites"
                                            :depends-on ("packages"))))))
