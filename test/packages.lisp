(defpackage #:cl-undead-test
  (:use :cl :fiveam :cl-undead)
  (:import-from :cl-undead
                ;; Helpers
                :flatten

                ;; Internal
                :find-in-tree
                  :make-named-p :make-id-p
                ;; API-ish
                :process-template))
