;Разработать функцию, производящую удаление из исходного списка всех элементов с четными номерами. (a b c d e) -> (a c e)

(defun del-even(lst) (if (car lst)
(cons (car lst)(del-even (cddr lst)))))

(print(del-even '(a b c d e)))
