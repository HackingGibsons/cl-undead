;;;; cl-undead.lisp

(in-package #:cl-undead)

(defun process-template (template &rest rules)
  "Process the `template' according to the list of transformations
given by `rules' in the form (((CSS-PATH :selector :description) TREE-TRANSFORMATION)
                              ((CSS-PATH :AWESOME) LESS-AWESOME-TREE-TRANSFORMATION))"
  (let ((parsed (chtml:parse template nil))
        matches)
    (dolist (rule rules)
      (unless rule (return))
      (destructuring-bind (path . proc) rule
        (setf matches (find-in-tree parsed path))
        (mapc #'(lambda (match)
                  (if proc
                      (funcall proc match)
                      (let* ((parent (pt-parent match)) (siblings (pt-children parent)))
                        (setf (pt-children parent)
                              (remove-if (lambda (node) (eql node match)) siblings)))))
              matches)))
    parsed))

(defun node-named (name)
  (lambda (node)
    (string-equal (pt-name node) name)))

(defun find-in-tree (tree pred)
  (cond ((null tree) nil)
        ((funcall pred tree) `(,tree))
        (t (loop for child in (pt-children tree)
              if child appending (find-in-tree child pred)))))
