(in-package :cl-undead-test)

(defmacro file-string (filename)
  (let ((g!f (gensym "f-stream"))
        (g!len (gensym "len"))
        (g!out (gensym "out")))
  `(with-open-file (,g!f ,filename)
     (let* ((,g!len (file-length ,g!f)) (,g!out (make-string ,g!len)))
       (values ,g!out
               (read-sequence ,g!out ,g!f))))))

(defmacro def-mixture (name arglist mixins &body body)
  "Make a fixture mixing in the fixture macros."
  (let* ((g!eval-body (gensym "eval-body"))
         (callchain `(,g!eval-body)))
      (dolist (mixin (reverse mixins) callchain)
        (setf callchain `(,mixin ,callchain)))

      `(def-fixture ,name ,arglist
         (macrolet ((,g!eval-body () '(progn ,@body)))
           ,callchain))))
