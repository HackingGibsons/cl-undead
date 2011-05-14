;;;; cl-undead.lisp
(in-package #:cl-undead)

;; Rule application
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
                (or (and proc (funcall proc match))
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

;; Helpers
(defun node-id (node)
  "The value of the id attribute of `node'"
  (node-attr node :id))

(defun node-attrs (node)
  "The plist of all attributes of `node'"
  (let ((attrs (pt-attrs node)))
    (and (listp attrs)
         attrs)))

(defun node-attr (node attr)
  "Get the attribute `attr' of `node' or nil"
  (getf (node-attrs node) attr))

(defun node-data-nodes (node &optional first)
  "Get the children of `node' that are named :pcdate
If `first' is non-nil return the car of the result (used in `node-data'"
  (funcall (if first 'car 'identity)
           (remove-if-not (make-named-p :pcdata)
                          (pt-children node))))

(defun node-has-data-p (node)
  "Does the given node have only one data node?"
  (= 1 (length (node-data-nodes node))))

(defun node-data (node)
  "Get the text content of the only data node child of `node'"
  (and (node-has-data-p node)
       (pt-attrs (node-data-nodes node t))))

(defun set-node-data (node val)
  "Set the node content of the only data node child of `node'"
  (let ((node-data (node-data-nodes node t)))
    (setf (pt-attrs node-data) val)))

(defsetf node-data set-node-data)
    
;; find-in-tree and friends
(defun make-named-p (name)
  "Make a predicate matching nodes named `name'"
  (lambda (node)
    (string-equal (pt-name node) name)))

(defun make-id-p (id)
  "Make a predicate matching nodes with id `id'"
  (lambda (node)
    (string-equal (node-id node) id)))

(defun find-in-tree (tree pred)
  "Walk the tree `tree' and return nodes that match the predicate `pred'
in a list. A nill predicate returns identity"
  (cond ((null tree) nil)
        ((null pred) tree)
        ((funcall pred tree) `(,tree))
        (t (loop for child in (pt-children tree)
              if child appending (find-in-tree child pred)))))
