            MOV     R0, #1 ; F(0) = 1
            MOV     R1, #1 ; F(1) = 1
            MOV     R5, #50 ; number of terms
            LDR     R4, =0x100 ; start adress

            ;       edge cases
            CMP     R5, #0 ; 0 terms
            BEQ     DONE

            CMP     R5, #1 ; 1 term
            BEQ     ONE

            CMP     R5, #2 ; Se pediu 2 termos
            BEQ     TWO

            ;       subtracts 2 of total
            STR     R0, [R4], #4 ; F(0) in old R4
            STR     R1, [R4], #4 ; F(1) in incremented R4
            SUB     R5, R5, #2 ; R5 has the first 2 terms

LOOP        
            ADD     R2, R0, R1 ; R2 = next number
            STR     R2, [R4], #4 ; updates r4 to receive r2 and increments r4
            MOV     R0, R1 ; old r1 becomes new r0
            MOV     R1, R2 ; old r1 becomes new r2

            SUBS    R5, R5, #1 ; counter--
            BNE     LOOP ; while r5 > 0
            B       DONE ; z flag = 1

ONE    
            STR     R0, [R4], #4 ; F(0) = 1
            B       DONE

TWO 
            STR     R0, [R4], #4 ; F(0) = 1
            STR     R1, [R4], #4 ; F(1) = 1

DONE        
            MOV     R7, #0
