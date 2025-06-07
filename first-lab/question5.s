                    ;       factorial calculator
                    ;       saves result in data memory

                    MOV     R0, #12 ; input number
                    LDR     R1, =0x400 ; arbitrary memory location to store result

                    MOV     R2, #1 ; factorial accumulator (baseline result)
                    MOV     R3, R0 ; counter

                    STR     R0, [R1], #4 ; store original number

FACTORIAL_LOOP      
                    CMP     R3, #1 ; initial case: if counter <= 1, done
                    BLE     STORE_FACTORIAL

                    MOV     R4, R2 ; current factorial result
                    MOV     R5, R3 ; current counter

                    B       MULTIPLY_SUBROUTINE

RETURN_FROM_MULT    
                    MOV     R2, R6 ; update factorial result with multiplication output
                    SUB     R3, R3, #1 ; decrement counter
                    B       FACTORIAL_LOOP

STORE_FACTORIAL     
                    STR     R2, [R1] ; store final factorial result
                    B       FINAL

                    ;       binary multiplication subroutine
                    ;       input: R4 (multiplicand), R5 (multiplier)
                    ;       output: R6 (result)

MULTIPLY_SUBROUTINE 
                    MOV     R6, #0 ; result accumulator
                    MOV     R7, R4 ; copy of multiplicand

                    ;       handle zero cases
                    CMP     R4, #0
                    BEQ     MULT_RETURN
                    CMP     R5, #0
                    BEQ     MULT_RETURN

MULT_LOOP           
                    ;       check lsb of multiplier
                    AND     R8, R5, #1
                    CMP     R8, #1
                    ADDEQ   R6, R6, R7 ; if lsb=1, add multiplicand to result

                    ;       shift operations
                    LSR     R5, R5, #1 ; shift multiplier right
                    LSL     R7, R7, #1 ; shift multiplicand left

                    ;       continue if multiplier not zero
                    CMP     R5, #0
                    BNE     MULT_LOOP

MULT_RETURN         
                    B       RETURN_FROM_MULT ; return to factorial loop

FINAL         
                    MOV     R7, #0
