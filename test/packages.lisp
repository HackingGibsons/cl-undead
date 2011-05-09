(defpackage #:cl-undead-test
  (:use :cl :fiveam :cl-undead)
  (:import-from :cl-undead
                ;; Internal
                :find-in-tree :make-named-p
                ;; API-ish
                :process-template))
