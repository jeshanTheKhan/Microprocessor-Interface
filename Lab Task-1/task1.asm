;Take input in the register AX, and then move it to BX using the MOV instruction.

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX , AX   
    
MAIN ENDP
END MAIN