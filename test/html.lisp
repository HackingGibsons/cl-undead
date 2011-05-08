(in-package :cl-undead-test)
(in-suite main)

(test (can-haz-html :fixture html/simple)
  (is (> (length template-data) 0)))
