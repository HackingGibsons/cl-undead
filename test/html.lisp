(in-package :cl-undead-test)
(in-suite main)

(test (can-haz-html :fixture html/simple)
  (is (> (length template-data) 0)))

(test (can-find-root :fixture html/simple)
  (is (find-in-tree parsed-data (make-named-p :html))))

(test (can-find-children :fixture html/simple)
  (is (eql 1 (length (find-in-tree parsed-data (make-named-p :body)))))
  (is (eql 2 (length (find-in-tree parsed-data (make-named-p :span))))))

(test (can-find-node-by-id :fixture html/simple)
   (let ((spans-test (find-in-tree parsed-data (make-id-p :test)))
         (spans-wrapped (find-in-tree parsed-data (make-id-p :wrapped))))

    (is-false (null spans-test))
    (is-false (null spans-wrapped))))
