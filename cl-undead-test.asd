(asdf:defsystem #:cl-undead-test
  :depends-on (#:cl-undead #:fiveam)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "utils" :depends-on ("packages"))

                                     (:file "mixins" :depends-on ("utils"))
                                     (:file "fixtures" :depends-on ("mixins"))

                                     (:file "suites" :depends-on ("fixtures"))

                                     (:file "html" :depends-on ("suites"))
                                     (:file "driver" :depends-on ("suites"))))))
