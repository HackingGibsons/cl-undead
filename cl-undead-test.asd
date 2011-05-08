(asdf:defsystem #:cl-undead-test
  :depends-on (#:cl-undead #:fiveam)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "utils" :depends-on ("packages"))

                                     (:file "fixtures" :depends-on ("utils"))
                                     (:file "suites" :depends-on ("fixtures" "utils"))

                                     (:file "html" :depends-on ("suites"))))))
