;На одной улице стоят в ряд 4 дома, в каждом из них живет по одному человеку. Их зовут Василий, Семен, Геннадий и Иван.  Известно, что все они имеют разные профессии: скрипач, столяр, охотник и врач. Известно, что
;  (1) Столяр живет правее охотника.
;  (2) Врач живет левее охотника.
;  (3) Скрипач живет с краю.
;  (4) Скрипач живет рядом с врачом.
;  (5) Семен не скрипач и не живет рядом со скрипачом.
;  (6) Иван живет рядом с охотником.
;  (7) Василий живет правее врача.
;  (8) Василий живет через дом от Ивана.
;Определите, кто где живет, и запишите начальные буквы имен жильцов всех домов слева направо.

; печать списка списков

(defun writelst (lst)
  (cond((null lst) (write-line ""))((and (write (car lst)) (write-line "") (writelst (cdr lst))))))

(defun sinc (n) (cond ((>= n 0) (+ n 1)) (n)))

(defun num (x lst)(cond((null lst) -1)((EQUAL (car lst) x) 0)((sinc (num x (cdr lst))))))

(defun mem (x lst)(cond((null lst) NIL)((EQUAL x (car lst)) T)((mem x (cdr lst)))))

(defun concat (l1 l2)(cond((null l1) l2)((cons (car l1) (concat (cdr l1) l2)))))

(defun combi1 (x lst)(cond((null lst) NIL)((and (atom (car lst)) (not (EQUAL x (car lst))))(cons (list x (car lst)) (combi1 x (cdr lst))))
((and (not (atom (car lst))) (not (mem x (car lst)))) (cons (cons x (car lst)) (combi1 x (cdr lst))))((combi1 x (cdr lst)))))

(defun combi2 (l1 l2)(cond((null l1) NIL)((concat (combi1 (car l1) l2) (combi2 (cdr l1) l2) ))))

(defun combi3 (x lst)(cond((null lst) NIL)((cons (list x (car lst)) (combi3 x (cdr lst))))))

(defun combi4 (l1 l2)(cond((null l1) NIL)((concat (combi3 (car l1) l2) (combi4 (cdr l1) l2)))))

(defun combi_4 (lst)(combi2 lst (combi2 lst (combi2 lst lst))))

;  (1) Столяр живет правее охотника.
(defun u1(p) (> (num "Carpenter" p)(num "Hunter" p)))
;  (2) Врач живет левее охотника.
(defun u2(p) (< (num "Doctor" p)(num "Hunter" p)))
;  (3) Скрипач живет с краю.
(defun u3(p) (or(= (num "Violinist" p) 0) (= (num "Violinist" p) 3)))
;  (4) Скрипач живет рядом с врачом.
(defun u4(p) (=  (abs (- (num "Violinist" p)(num "Doctor" p))) 1))
;  (5) Семен не скрипач и не живет рядом со скрипачом.
(defun u5(n p)
        (>  (abs (- (num "Sam" n)(num "Violinist" p))) 0)
        (> (abs (- (num "Sam" n)(num "Doctor" p))) 1)
)
;  (6) Иван живет рядом с охотником.
(defun u6(n p) (=  (abs (- (num "Ivan" n)(num "Hunter" p))) 1))
;  (7) Василий живет правее врача.
(defun u7(n p) (> (num "Vasily" n)(num "Doctor" p)))
;  (8) Василий живет через дом от Ивана.
(defun u8(n) (=  (abs (- (num "Vasily" n)(num "Ivan" n))) 2))


(defun ok (n_p)(and
                (u1 (nth 1 n_p))
                (u2 (nth 1 n_p))
                (u3 (nth 1 n_p))
                (u4 (nth 1 n_p))
                (u5 (nth 0 n_p)(nth 1 n_p))
                (u6 (nth 0 n_p)(nth 1 n_p))
                (u7 (nth 0 n_p)(nth 1 n_p))
                ;(u8 (nth 0 n_p))
                ))

(defun writeansw(l)(cond((null l) (write-line "END"))((ok (car l)) (and (writelst (car l)) (writeansw (cdr l))))((writeansw (cdr l)))))

(writeansw (combi4 (combi_4 (list "Vasily" "Sam" "Gennady" "Ivan"))(combi_4 (list "Doctor" "Hunter" "Violinist" "Carpenter"))))