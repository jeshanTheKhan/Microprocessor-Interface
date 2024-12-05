;Subtract two numbers using two registers. Do you always get the correct
;answer? What happens when you subtract larger number from the smaller one?

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX ,  6752H 
    MOV CX , AX    
    
    SUB CX , BX 
    
MAIN ENDP
END MAIN