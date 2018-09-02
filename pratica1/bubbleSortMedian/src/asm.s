        PUBLIC f_asm

        SECTION .text : CODE (2)
        THUMB
        
        
        
f_asm:
        MOV     R2,     R1                              ;coloca no R2 o valor de R1, que é o tamanho do vetor

outerloop:                                              ;loop de fora do bubble sort
        CBZ     R2,     outerloopend                    ;condicao do fim do loop
        SUB     R2,     R2,     #1                      ;decremento do loop
        SUB     R3,     R1,     #1                      ;coloca no R3 o valor de R1 decrementado, para usar no
                                                        ;loop mais interno do bubble sort
        B       innerloop                               ;chamada do loop interno
  
innerloop:                                              ;loop interno do bubble sort
        CBZ     R3,     innerloopend                    ;condicao do fim do loop
        MOV     R4,     R3                              ;pega o valor de RY para fazer a comparação do bubble sort
        SUB     R3,     R3,     #1                      ;decremento do loop
        LDR     R5,     [R0,R4,LSL #2]                  ;coloca o valor de R0[R4] em R5       
        LDR     R6,     [R0,R3,LSL #2]                  ;coloca o valor de R0[R3] em R6
        CMP     R5,     R6                              ;compara R0[R4]<R0[R3]
        BLT     swap                                    ;se R0[R4]<R0[R3], comuta os valores
        B       innerloop                               ;volta pra sequencia do loop se n houve comutacao
  
swap:                                                   ;"funcao" que comuta duas variaveis
        STR     R6,     [R0,R4,LSL #2]                  ;coloca o valor de R0[RY] em R0[RZ]
        STR     R5,     [R0,R3,LSL#2]                   ;coloca o valor de RW em R0[RY]
        B       innerloop                               ;volta pra sequencia do loop se houve comutacao

innerloopend:
        B       outerloop
outerloopend:
        ;MOV     R0,     RK
        BX      LR
        END