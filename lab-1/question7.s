            ;       euclidean algorithm: calculates GCD of two integers
            ;       saves result in data memory

            MOV     R0, #10 ; m
            MOV     R1, #22 ; n

            LDR     R4, =0x100 ; memory location to store result

EUCLID_LOOP 
            CMP     R1, #0 ; check if n == 0
            BEQ     STORE_GCD ; if n == 0, done (gcd = m)

            ;       calculate m % n
            ;       R0 = m, R1 = n
            MOV     R2, R0 ; temp: R2 = m
MOD_LOOP    
            CMP     R2, R1 ; if remainder < divisor
            BLT     FINISH_MOD
            SUB     R2, R2, R1 ; remainder -= divisor
            B       MOD_LOOP

FINISH_MOD  
            ;       update m and n for next iteration
            MOV     R0, R1 ; m = n
            MOV     R1, R2 ; n = remainder
            B       EUCLID_LOOP

STORE_GCD   
            STR     R0, [R4] ; store GCD in memory

            MOV     R7, #0
