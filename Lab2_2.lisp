(defparameter filename "text.txt")
(defparameter filename2 "text_i.txt")

(defun cat_file(path)
    (let ((fstream (open path :direction :input :if-does-not-exist :error)))
      (when fstream
        (setf ind 0) 
        (loop for line = (read-line fstream nil)
           while line do 
             (progn
             (format t "~a~%" line)
             (setf ind (1+ ind))
             (if (eq ind 20) 
               (progn
                 (format t "------------------------>>> PRESS ANY KEY to continue~%")
                 (setf ind 0) 
                 (read-char)
               ) ;_end_of progn
             ) ;_end_of if 
           ) ;_end_of while
        ) ;_end_of loop
        (close fstream)
      ) ;_end_of when
    ) ;_end_of let
) ;_end_of defun

(progn (cat_file filename) (cat_file filename2))
