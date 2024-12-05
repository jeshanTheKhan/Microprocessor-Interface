;Take a number in AX, and if it’s a negative number, replace it by 5.                                                                                 .MODEL SMALL
.STACK 100H

.DATA
    MSG_POS DB 'The number is positive or zero.', 0DH, 0AH, '$'
    MSG_NEG DB 'The number was negative. Replaced by 5.', 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX       

   
    MOV AX, 5       ; Load the input number into AX

    CMP AX, 0        ; Compare AX with 0
    JGE POSITIVE     

    ; If AX < 0 (negative):
    MOV AX, 5        
    LEA DX, MSG_NEG  
    MOV AH, 09H      
    INT 21H         

    JMP END_PROGRAM  

POSITIVE:
    LEA DX, MSG_POS  
    MOV AH, 09H      
    INT 21H          

END_PROGRAM:
    MOV AH, 4CH      
    INT 21H          

MAIN ENDP
END MAIN