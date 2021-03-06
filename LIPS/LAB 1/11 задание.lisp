;11. Дан список ( (A (B C)) (D (E) K ) L ) получить:
; 11.1. элемент K
(print(CAR(CDDR(CAR(CDR'( (A (B C)) (D (E) K ) L ))))))

; 11.2. элемент E
(print(CAAR(CDR(CAR(CDR'( (A (B C)) (D (E) K ) L ))))))

; 11.3. список (A B C)
(print(list
       (CAAR '( (A (B C)) (D (E) K ) L ))
       (CAAR(CDR(CAR '( (A (B C)) (D (E) K ) L ))))
       (CAR(CDAR(CDR(CAR '( (A (B C)) (D (E) K ) L )))))
            ))

; 11.4. список (D K L)
(print(list
       (CAAR(CDR '( (A (B C)) (D (E) K ) L )))
       (CAR(CDDR(CAR(CDR'( (A (B C)) (D (E) K ) L )))))
       (CADR(CDR'( (A (B C)) (D (E) K ) L )))
            ))

; 11.5. список ((B C) K)
(print(list
       (CADAR '( (A (B C)) (D (E) K ) L ))
       (CAR(CDDR(CAR(CDR'( (A (B C)) (D (E) K ) L )))))
            ))

; 11.6. список (C A K)
(print(list
       (CAR(CDAR(CDR(CAR '( (A (B C)) (D (E) K ) L )))))
       (CAAR '( (A (B C)) (D (E) K ) L ))
       (CAR(CDDR(CAR(CDR'( (A (B C)) (D (E) K ) L )))))
            ))
