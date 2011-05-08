(in-package :cl-undead-test)
(in-suite main)

(with-fixture html/simple ()
  (test can-haz-html
    (is (> 0 (length template-data)))))
