;Swap two numbers using ADD/SUB instructions only.

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX ,  6752H 
    
    ADD AX , BX
    
    SUB BX , AX
    
    
    SUB AX , BX 
    
MAIN ENDP
END MAIN