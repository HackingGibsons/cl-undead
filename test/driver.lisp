(in-package :cl-undead-test)
(in-suite main)

(test (apply-no-rules-using-path :fixture html/simple+lhtml)
  (let ((new-parsed (process-template template-file nil)))
    (is (equal (to-lhtml parsed-data) (to-lhtml new-parsed)))))
