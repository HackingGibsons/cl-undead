(in-package :cl-undead-test)

(def-fixture html/simple (&key (template "test.simple.html") (dir "data"))
  (let* ((data-dir (asdf:system-relative-pathname :cl-undead-test
                                                 (make-pathname :directory `(:relative ,dir))))
         (template-file (make-pathname :name template :defaults data-dir))
         (template-data (file-string template-file))
         (parsed-data (chtml:parse template-data nil)))
    (declare (ignorable data-dir template-file template-data parsed-data))
    (&body)))
