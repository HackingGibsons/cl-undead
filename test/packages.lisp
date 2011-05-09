(defpackage #:cl-undead-test
  (:use :cl :fiveam :cl-undead)
  (:shadowing-import-from :cl-undead
                          ;; Helpers
                          :flatten

                          ;; Internal
                          :find-in-tree
                          :make-named-p :make-id-p
                          :node-id :node-attrs :node-attr :node-data :node-has-data-p
                          ;; API-ish
                          :process-template))
