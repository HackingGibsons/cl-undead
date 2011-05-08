(defmacro file-string (filename)
  (let ((g!f (gensym "f-stream"))
        (g!len (gensym "len"))
        (g!out (gensym "out")))
  `(with-open-file (,g!f ,filename)
     (let* ((,g!len (file-length ,g!f)) (,g!out (make-string ,g!len)))
       (values ,g!out
               (read-sequence ,g!out ,g!f))))))
