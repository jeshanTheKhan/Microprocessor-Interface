;Perform the following arithmetic operations:
;(A + B) * (C - D) / E

.MODEL SMALL
.STACK 100H
.DATA
    A DB 02H
    B DB 04H
    C DB 07H
    D DB 06H
    E DB 02H
    RESULT_MULTIPLE DB ?
    RESULT_DIVISION DB ?
    RESULT_ADDITION DB ?
    RESULT_SUBSTRACTION DB ?
   MSG1 DB "Result of (A + B) * (C-d) / E = $"
    
.CODE
MAIN PROC
      
      MOV AX, @DATA
      MOV DS, AX
      
      ;Addition
      MOV AL, A
      MOV BL, B
      ADD AL, BL
      MOV RESULT_ADDITION, AL
      
      ;SubstractioN
      MOV AL, C
      MOV BL, D 
      SUB AL, BL
      MOV RESULT_SUBSTRACTION, AL
      
      ;Multiply
      MOV AL, RESULT_ADDITION    
      MOV BL, RESULT_SUBSTRACTION
      MUL BL
      MOV RESULT_MULTIPLE, AL
      
      ;Division
      MOV AL, RESULT_MULTIPLE
      MOV BL ,E
      DIV BL
      MOV RESULT_DIVISION, AL
      
      ;Display Message
      MOV DX, OFFSET MSG1
      MOV AH, 09H
      INT 21H
      
      MOV DL,RESULT_DIVISION
      MOV AH, 02H
      INT 21H
      
      
      MOV AH, 4CH
      INT 21H
    
    
    
    
MAIN ENDP
END MAIN