        PUBLIC media

        SECTION .text : CODE (2)
        THUMB
        
        
        
media:
        MOV     R2,     R1
        MOV     R3,     #0

loop:
        CBZ     R1,     loopend 
        LDRH    R4,     [R0,    R1,      LSL #1]
        ADD     R3,     R3,     R4
        SUB     R1,     R1,     #1
        B loop

loopend:
        UDIV    R0,     R3,     R2
        BX      LR
        END

