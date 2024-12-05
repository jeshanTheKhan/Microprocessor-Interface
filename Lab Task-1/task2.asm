;Swap two numbers, using a maximum of 3 registers.
;Hint: Use the MOV instruction.

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX ,  6752H    
    
    MOV CX , BX
    MOV BX , AX
    MOV AX , CX
    MOV CX , 0000H
    
MAIN ENDP
END MAIN