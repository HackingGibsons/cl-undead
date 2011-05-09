(in-package :cl-undead-test)
(in-suite main)

(test (apply-no-rules-using-path :fixture html/simple+lhtml)
  (let ((new-parsed (process-template template-file nil)))
    (is (equal (to-lhtml parsed-data) (to-lhtml new-parsed)))))

(test (can-remove-node-by-id :fixture html/simple)
  (flet ((remove-node (node) (declare (ignorable node)) nil))
    (let ((result-f (process-template template-data (cons (make-id-p :table)  #'remove-node)))
          (result-s (process-template template-data (cons (make-id-p :table)  nil))))

      (is-false (null result-f))
      (is-false (null result-s))

      (is (and (find-in-tree parsed-data (make-id-p :table))
               (not (find-in-tree result-f (make-id-p :table)))
               (not (find-in-tree result-s (make-id-p :table))))))))
