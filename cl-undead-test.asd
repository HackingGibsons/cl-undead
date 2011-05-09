(asdf:defsystem #:cl-undead-test
  :depends-on (#:cl-undead #:fiveam)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "fixtures" :depends-on ("helpers"))
                                     (:file "suites" :depends-on ("fixtures"))

                                     (:module "helpers" :depends-on ("packages")
                                              :components ((:file "utils")
                                                           (:file "mixins" :depends-on ("utils"))))

                                     (:module "tests" :depends-on ("suites")
                                              :components ((:file "html")
                                                           (:file "driver")))))))

