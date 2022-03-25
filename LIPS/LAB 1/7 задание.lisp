;7. Дан список ( A ((B) (C) ) (D) (K) L) получить
; 7.1 элемент A
(print(CAR'( A ((B) (C) ) (D) (K) L)))

; 7.2 элемент D
(print(CAAR(CDDR'( A ((B) (C) ) (D) (K) L))))

; 7.3 список (D)
(print(list
       (CAAR(CDDR'( A ((B) (C) ) (D) (K) L)))
       ))

; 7.4 список (A B C)
(print(list
       (CAR'( A ((B) (C) ) (D) (K) L))
       (CAAAR(CDR'( A ((B) (C) ) (D) (K) L)))
       (CAAR(CDR(CAR(CDR'( A ((B) (C) ) (D) (K) L)))))
       ))

; 7.5 список ( A (D) (C))
(print(list
       (CAR'( A ((B) (C) ) (D) (K) L))
       (CAR(CDDR'( A ((B) (C) ) (D) (K) L)))
       (CAR(CDR(CAR(CDR'( A ((B) (C) ) (D) (K) L)))))
       ))

; 7.6 список (D A B)
(print(list
       (CAAR(CDDR'( A ((B) (C) ) (D) (K) L)))
       (CAR'( A ((B) (C) ) (D) (K) L))
       (CAAAR(CDR'( A ((B) (C) ) (D) (K) L)))
       ))
