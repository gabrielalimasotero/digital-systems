              ;       calculate multiplication between two integers
              ;       saves result in data memory
              ;       "Russian peasant” or “binary multiplication”

              ;       choose input numbers
              MOV     R0, #15
              MOV     R1, #2

              LDR     R4, =0x200 ; random memory base address
              STR     R0, [R4], #4 ; number in register
              STR     R1, [R4], #4 ; how many times (multiplier) in register

              MOV     R2, #0 ; result accumulator
              MOV     R3, R0 ; copy of number

              ;       zero cases
              CMP     R0, #0
              BEQ     STORE_RESULT
              CMP     R1, #0
              BEQ     STORE_RESULT

MULTIPLY_LOOP 
              ;       check LSB of multiplier
              AND     R5, R1, #1 ; isolate least significant bit
              CMP     R5, #1
              ADDEQ   R2, R2, R3 ; if LSB=1, add number in r3 to result

              ;       shift operations for next iteration
              LSR     R1, R1, #1 ; shift multiplier right (divide by 2)
              LSL     R3, R3, #1 ; shift number left (multiply by 2)

              ;       Continue if multiplier not zero
              CMP     R1, #0
              BNE     MULTIPLY_LOOP

STORE_RESULT  
              STR     R2, [R4], #4 ; store multiplication result in memory

              ;       store operation result in memory
              LDR     R6, =0x300 ; random memory location of result
              STR     R0, [R6], #4 ; original first number
              STR     R1, [R6], #4 ; original second number (now 0 from shifts)
              STR     R2, [R6] ; final result

FINAL         
              MOV     R7, #0
