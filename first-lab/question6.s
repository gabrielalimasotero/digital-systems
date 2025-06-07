              ;       euclidean division: calculates quotient and remainder
              ;       saves quotient and remainder in data memory

              ;       inputs
              MOV     R0, #20 ; dividend (example: 23)
              MOV     R1, #3 ; divisor (example: 4)

              LDR     R4, =0x500 ; memory location to store quotient and remainder

              ;       initialize quotient and remainder
              MOV     R2, #0 ; quotient
              MOV     R3, R0 ; remainder starts as dividend

DIVISION_LOOP 
              CMP     R3, R1 ; compare remainder and divisor
              BLT     STORE_RESULTS ; if remainder < divisor, done

              SUB     R3, R3, R1 ; remainder -= divisor
              ADD     R2, R2, #1 ; quotient += 1
              B       DIVISION_LOOP

STORE_RESULTS 
              STR     R2, [R4], #4 ; store quotient in memory
              STR     R3, [R4] ; store remainder in memory

              ;       end program marker
              MOV     R7, #0
