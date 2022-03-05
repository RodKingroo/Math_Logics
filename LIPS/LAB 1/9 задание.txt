;9. Дан список ((A) (B (C D) E (K L)) получить:
; 9.1 элемент С
(print(CAAR(CDR(CAR(CDR '((A) (B (C D) E (K L))))))))
      
; 9.2 список (C D)
(print(LIST
       (CAAR(CDR(CAR(CDR '((A) (B (C D) E (K L)))))))
       (CAR(CDAR(CDR(CAR(CDR '((A) (B (C D) E (K L))))))))
       ))

; 9.3 получить элемент K
(print (CAAR(CDDDR (CAR(CDR '((A) (B (C D) E (K L))))))))

; 9.4 получить список (A B C)
(print(LIST
       (CAAR '((A) (B (C D) E (K L))))
       (CAAR(CDR '((A) (B (C D) E (K L)))))
       (CAAR(CDR(CAR(CDR '((A) (B (C D) E (K L)))))))
       ))

; 9.5 получить список ( B A K )
(print(LIST
       (CAAR(CDR '((A) (B (C D) E (K L)))))
       (CAAR '((A) (B (C D) E (K L))))
       (CAAR(CDDDR (CAR(CDR '((A) (B (C D) E (K L)))))))
       ))

; 9.6 получить список (E (K L))
(print(LIST
        (CAR(CDR(CDR(CAR(CDR'((A) (B (C D) E (K L))))))))
        (CAR(CDDDR(CAR(CDR '((A) (B (C D) E (K L)))))))
       ))

; 9.7 получить список ( (A) (K L))
(print(LIST
       (CAR '((A) (B (C D) E (K L))))
       (CAR(CDDDR(CAR(CDR '((A) (B (C D) E (K L)))))))
       ))
