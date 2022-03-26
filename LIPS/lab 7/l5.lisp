 ;Разработать функцию, находящую теоретико-множественную разность двух списков

(defun R (w v &aux (a (car w)) (d ( cdr w)))(when w (if (member a v) (R d v)(cons a (R d v)))))
              
(print(R '(1 2 3 4 5 6) '(6 7 8)))
