(in-package :cl-undead-test)
(in-suite main)

(test (can-haz-html :fixture html/simple)
  (is (> (length template-data) 0)))

(test (can-find-root :fixture html/simple)
  (is (find-in-tree parsed-data (node-named :html))))

(test (can-find-children :fixture html/simple)
  (is (eql 2 (length (find-in-tree parsed-data (node-named :span)))))
  (is (eql 2 (length (find-in-tree parsed-data (node-named :span))))))