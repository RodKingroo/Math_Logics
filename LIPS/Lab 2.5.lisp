(defun qdif (x y) (* (- x y) (+ x y)))

(defun y (x) (^ expt (- (^ x 2))))

(defun sumlist (x) (cond ((null x) 0)
(T (+ (car x) (sumlist (cdr x))))))

(defun fact (n) (cond ((= n 0) 1) (T (* n (fact (- n 1))))))

(defun f (x n)(cond((= n 1) x)(T(+( *(exp -2(- n 1)))
                    (f x (- n 1))
               )
          )
     )
)

(print (sin 1.0))
(print (f 1.0 3))
