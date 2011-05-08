;;;; cl-undead.lisp

(in-package #:cl-undead)

(defun process-template (template &rest rules)
  "Process the `template' according to the list of transformations
given by `rules' in the form (((CSS-PATH :selector :description) TREE-TRANSFORMATION)
                              ((CSS-PATH :AWESOME) LESS-AWESOME-TREE-TRANSFORMATION))"
  :undefined)

(defun node-named (name)
  (lambda (node)
    (string-equal (pt-name node) name)))

(defun find-in-tree (tree pred)
  (cond ((null tree) nil)
        ((funcall pred tree) `(,tree))
        (t (loop for child in (pt-children tree)
              if child appending (find-in-tree child pred)))))
