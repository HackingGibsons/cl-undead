(in-package :cl-undead-test)

;; Fixture mixins
(defmacro +html/simple (&body body)
  (let ((template "test.simple.html")
        (dir "data"))
    `(let* ((data-dir (asdf:system-relative-pathname :cl-undead-test
                                                     (make-pathname :directory (list :relative ,dir))))
            (template-file (make-pathname :name ,template :defaults data-dir))
            (template-data (file-string template-file))
            (parsed-data (chtml:parse template-data nil)))
       (declare (ignorable data-dir template-file template-data parsed-data))
       ,@body)))

(defmacro +html/lhtml (&body body)
  `(flet ((to-lhtml (tree) (chtml:serialize-pt tree (chtml:make-lhtml-builder))))
     ,@body))

