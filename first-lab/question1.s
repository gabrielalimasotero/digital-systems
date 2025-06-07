       ;       LDR can load values into a register using ',=value',
       ;       or load the value pointed to by a pointer using '[register, offset] or [hexadress]'.

       LDR     R0, =0x12
       LDR     R1, =0x12AB
       LDR     R2, =0x12AB34
       LDR     R3, =0x12AB34CD

       LDR     R4, =0x100 ; first address, will iterate in steps of 4 bytes up to 0x10C
       ;       R4 is now acting as a pointer
       ;       Note: STR (store register) is the opposite of LDR. It saves the value of a register into a memory address.
       STR     R0, [R4]
       STR     R1, [R4, #4]
       STR     R2, [R4, #8]
       STR     R3, [R4, #12]

       ;       load values back from memory into new registers
       LDR     R8, [R4]
       LDR     R9, [R4, #4]
       LDR     R10, [R4, #8]
       LDR     R11, [R4, #12]
