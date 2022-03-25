;5. Дан список ( A (B C) (D (E) K L)) получить:

;        	5.1 элемент К
(print(CAR(CDDR(CAR(CDDR'(A (B C) (D (E) K L)))))))

;        	5.2 элемент E
(print(CAAR(CDR(CAR(CDDR'(A (B C) (D (E) K L))))))))

;       	5.3 список (A B C)
(print (list 
	 (CAR '( A (B C) (D (E) K L))) 
	 (CAR (CAR (CDR '( A (B C) (D (E) K L))))) 
	 (CAR (CDR (CAR (CDR '( A (B C) (D (E) K L))))))
	 ))

;	   	5.4 список ( K D L)
(print (list 
        (CAR(CDDR(CAR(CDDR'(A (B C) (D (E) K L)))))) 
        (CAAR(CDDR'(A (B C) (D (E) K L)))) 
        (CAR(CDDDR(CAR(CDDR'(A (B C) (D (E) K L))))))
        ))

;	   	5.5 список ( ( B C) K)
(print (list  
        (CAR (CDR '(A (B C) (D (E) K L))))
        (CAR(CDDR(CAR(CDDR'(A (B C) (D (E) K L))))))
        ))

;		5.6 список ( С A K )
(print (list  
        (CAR (CDR (CAR (CDR '( A (B C) (D (E) K L))))))
        (CAR '( A (B C) (D (E) K L)))
        (CAR(CDDR(CAR(CDDR'(A (B C) (D (E) K L))))))
        ))
