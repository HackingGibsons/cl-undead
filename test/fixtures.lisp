(in-package :cl-undead-test)

(rem-fixture 'html/simple)
(def-fixture html/simple
    (&key (template "test.simple.html") (dir "data"))
  (let* ((data-dir (asdf:system-relative-pathname :cl-undead-test
                                                 (make-pathname :directory `(:relative ,dir))))
         (template-file (make-pathname :name template :defaults data-dir))
         (template-data (file-string template-file)))
    (&body)))
