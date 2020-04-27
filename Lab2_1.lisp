;;Реализовать 3 функции: вставка в список по номеру, удаление из списка по позиции, поиск элемента по значению.
(defparameter S (list 7 3 8 1 2 34 13 0 27 131))

;;вставка по номеру со сдвигом
(defun insertA (list ind el)
(if (< ind (length list))
;;подпрограмма вставки элемента
(push el (cdr (nthcdr ind list)))
;;ничего не делать если индекс больше длины
(format t "Невозможно выполнить операцию: Индекс больше длины списка!"))
;;вывод списка
list)

;;вставка по номеру с заменой
(defun insertInst (lst ind el)
(if (< ind (length lst))
;;подпрограмма вставки элемента
(replace lst (list el) :start1 ind :start2 0)
;;ничего не делать если индекс больше длины
(format t "Невозможно выполнить операцию: Индекс больше длины списка!")
) ;_end of if
;;вывод списка
lst) ;_end of defun

;;удаление по номеру
(defun delete_id (lst ind)
(if (< ind (length lst))
(progn
;;сдвигаем хвост списка на одну позицию затирая ненужный элемент 
(replace lst (cdr (nthcdr ind lst)) :start1 ind :start2 0) 
;;затираем последний элемент NIL значением
(replace lst '(NIL) :start1 (1- (length lst)) :start2 0)
;;удаляем все элементы со значением NIL
(delete-if #'NULL lst)
)
;;ничего не делать если индекс больше длины
(format t "Невозможно выполнить операцию: Индекс больше длины списка!")
) ;_end of if
lst) ;_end_of defun

;;поиск по значению
(defun search_el (lst el)
 (progn 
  (setf ind 0)
  (setf flag 0)
  (dolist (x lst)
   (setf ind (1+ ind)) 
   (if (eq x el) 
    (progn 
     (format t "[~D] = ~D~%" ind x)
     (setf flag 1)
    ) ;_end_of progn
   ) ;_end_of if
  ) ;_end_of dolist
  (if (eq flag 0) (format t "Элементов с заданным значением не найдено!"))
 ) ;_end_of progn
) ;_end_of defun
