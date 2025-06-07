       ;       LDR can load immediate values into a register using '=',
       ;       or load the value pointed to by a pointer using '[ ]'.

       ;       Load immediate values into registers
       LDR     R0, =0x12
       LDR     R1, =0x12AB
       LDR     R2, =0x12AB34
       LDR     R3, =0x12AB34CD

       ;       R4 will be the base pointer for 4 contiguous addresses
       LDR     R4, =0x100 ; first address, will iterate in steps of 4 bytes up to 0x10C
       ;       R4 is now acting as a pointer
       ;       Note: STR (store register) is the opposite of LDR. It saves the value of a register into a memory address.
       STR     R0, [R4]
       STR     R1, [R4, #4]
       STR     R2, [R4, #8]
       STR     R3, [R4, #12]

       ;       Load values back from memory into new registers
       LDR     R8, [R4]
       LDR     R9, [R4, #4]
       LDR     R10, [R4, #8]
       LDR     R11, [R4, #12]
