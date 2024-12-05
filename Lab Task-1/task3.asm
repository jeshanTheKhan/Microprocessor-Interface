;Add two numbers using two registers.

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX ,  6752H 
    MOV CX , AX    
    
    ADD CX , BX 
MAIN ENDP
END MAIN