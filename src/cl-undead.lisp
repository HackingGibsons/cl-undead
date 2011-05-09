;;;; cl-undead.lisp
(in-package #:cl-undead)

(defun remove-node (node)
  "Remove the given node from the tree containing it"
  (let* ((parent (pt-parent node)) (siblings (pt-children parent)))
    (setf (pt-children parent)
          (remove-if (lambda (this-node) (eql this-node node)) siblings)))
  node)

(defun process-rule (tree rule)
  "Process the parsed template `tree' according to the `rule'
in the format of (search-rule . process-function-or-nil)
A processing function of nil will remove the matching node from the tree"
  (unless rule (return-from process-rule))
  (destructuring-bind (path . proc) rule
    (let ((matches (find-in-tree tree path)))
      (mapc #'(lambda (match)
                (if proc
                    (funcall proc match)
                    (remove-node match)))
            matches))))

(defun process-template (template &rest rules)
  "Process the `template' according to the list of transformations
given by `rules' in the form (((CSS-PATH :selector :description) TREE-TRANSFORMATION)
                              ((CSS-PATH :AWESOME) LESS-AWESOME-TREE-TRANSFORMATION))"
  (let ((parsed (chtml:parse template nil)))
    (dolist (rule rules)
      (process-rule parsed rule))
    parsed))

(defun node-named (name)
  (lambda (node)
    (string-equal (pt-name node) name)))

(defun find-in-tree (tree pred)
  (cond ((null tree) nil)
        ((funcall pred tree) `(,tree))
        (t (loop for child in (pt-children tree)
              if child appending (find-in-tree child pred)))))
