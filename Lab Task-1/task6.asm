;Perform the following arithmetic instructions. A, B, C are three variables to
;be declared beforehand.

.MODEL SMALL
.STACK 100H 
.DATA 
    A DW 0H
    B DW 0H
    C DW 0H
.CODE
MAIN PROC
    MOV AX ,  1245H
    MOV BX ,  6752H 
    
    ;  A = B - A 
    SUB BX , AX
    MOV A , BX
               
    ;A = -(A + 1) 
    MOV AX , A
    INC AX 
    NEG AX
    MOV A , AX 
    
    ;C = A + (B + 1)
    MOV AX , A
    MOV BX , B
    INC BX
    ADD AX , BX
    MOV C , AX
    
    ;A = B - (A - 1) 
    MOV AX ,A
    MOV BX ,B
    DEC AX
    SUB BX , AX
    MOV A , BX
    
    
    MOV AX, 4c00h 
    INT 21h  
    
    
MAIN ENDP
END MAIN