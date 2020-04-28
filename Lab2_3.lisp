(defparameter S (list 0 0 0 7 3 3 3 3 3 6 2 13 13 13 0 9 9 9 ))


(defun compress(lst)
  (setf compressed_lst (list))
  (setf count 1)
  (setf prev (car lst))
  (dolist (x (append (cdr lst) '(NIL))) 
    (progn 
      (if (eq x prev) 
        (setf count (1+ count))
        (progn
          (if (> count 1) 
            ;;(format t "YAHOO ")
            (setf compressed_lst (append compressed_lst (list (list count prev))))
            (setf compressed_lst (append compressed_lst (list prev)))
          ) ;_end_of if
          (setf count 1)
        ) ;end_of progn
      ) ;_end_of if
      (setf prev x)
    );end_of progn
  );_end_of dolist
  
compressed_lst) ;_end_of defun


(defun decompress(lst)
  (setf decomp_lst (list))
  (dolist (x lst)
    (if (consp x) 
      (setf decomp_lst (append decomp_lst (make-list (car x) :initial-element (cadr x))))
      (setf decomp_lst (append decomp_lst (list x)))
    );_end_of if
  );_end_of dolist
  decomp_lst
);_end_of defun




(setf S (compress S))
(setf S (decompress S))

