        PUBLIC median

        SECTION .text : CODE (2)
        THUMB
        

        
median:
        MOV     R5,     R0                              ;guarda o valor de R0 pra poder usar no outerloop
        MOV     R3,     R0                              ;coloca no R2 o valor de R1, que é o tamanho do vetor

cpyi2o:                                                 ;copia o vetor original para o de saida, a ser ordenado
        CBZ     R3,     outerloop                       ;depois que copiar, pode comecar a ordenar
        SUB     R3,     R3,     #1                      ;iteracao do loop
        LDRB    R4,     [R1,R3]                         ;carrega o valor, 
        STRB    R4,     [R2,R3]                         ;descarrega o valor no outro vetor
        B       cpyi2o                                  ;volta do loop

outerloop:                                              ;loop de fora do bubble sort
        CBZ     R5,     outerloopend                    ;condicao do fim do loop
        SUB     R5,     R5,     #1                      ;decremento do loop
        SUB     R3,     R0,     #1                      ;coloca no R3 o valor de R0 decrementado, para usar no
                                                        ;loop mais interno do bubble sort
        B       innerloop                               ;chamada do loop interno
  
innerloop:                                              ;loop interno do bubble sort
        CBZ     R3,     innerloopend                    ;condicao do fim do loop
        MOV     R4,     R3                              ;pega o valor de R3 para fazer a comparação do bubble sort
        SUB     R3,     R3,     #1                      ;decremento do loop
        LDRB    R7,     [R2,R4]                         ;coloca o valor de R2[R4] em R7       
        LDRB    R6,     [R2,R3]                         ;coloca o valor de R2[R3] em R6
        CMP     R7,     R6                              ;compara R2[R4]<R2[R3]
        BLT     swap                                    ;se R2[R4]<R2[R3], comuta os valores
        B       innerloop                               ;volta pra sequencia do loop se n houve comutacao
  
swap:                                                   ;"funcao" que comuta duas variaveis
        STRB    R6,     [R2,R4]                         ;coloca o valor de R2[R3] em R2[R4]
        STRB    R7,     [R2,R3]                         ;coloca o valor de R2[R4] em R2[R3]
        B       innerloop                               ;volta pra sequencia do loop se houve comutacao

innerloopend:
        B       outerloop                               ;volta pro loop de fora
        
        

outerloopend:                                           ;finaliza o loop de ordenacao
        TST     R0,     #1                              ;testa o tamanho do vetor com 1
        BNE     impar                                   ;se for igual, é impar
        B       par                                     ;se nao for igual, é par
        
impar:                                                  ;quando o array tem tamanho impar
        ASR     R0,     R0,     #1                      ;rolando pra direita, ele guarda a posicao desejada de offset
        LDRB    R0,     [R2, R0]                        ;na hora que fizer o offset, guarda no R0 porque ja é a resposta
        B fim                                           
par:                                                    ;quando o array tem tamanho par
        ASR     R0,     R0,     #1                      ;quando pegar a metade do tamanho do vetor, vai ser o offset para
        LDRB    R3,     [R2, R0]                        ;o item depois da metade do vetor, que é guardado
        SUB     R0,     R0,     #1                      ;se decrementar o valor do offset, 
        LDRB    R4,     [R2, R0]                        ;é o valor antes da metade do array, que é guardado
        ADD     R0,     R3,     R4                      ;entao é teita a media entre os valores
        ASR     R0,     R0,     #1                      ;guardados e esta é guardada em R0
        B fim
        
fim:
        BX LR
        END
