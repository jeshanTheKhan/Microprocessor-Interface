.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    
    MOV AX ,  400H
    MOV BX ,   20H
    DIV BX      
    
    MOV AH, 4Ch               
    INT 21H
    
MAIN ENDP
END MAIN             

