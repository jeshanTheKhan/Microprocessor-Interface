;Perform the following arithmetic operation:
;(1 + 2) * (3 – 1) / 5 + 3 + 2 – (1 * 2)

.MODEL SMALL
.STACK 100H
.DATA 
    ADDITION DB ?          
    SUBSTRACTION DB ?
    MULTIPLICATION DB ?
    DIVISION DB ?
.CODE
MAIN PROC
    MOV AX, @DATA          
    MOV DS, AX

    ; Step 1: (1 + 2)
    MOV AL, 1              
    ADD AL, 2              

    ; Step 2: (3 - 1)
    MOV BL, 3              
    SUB BL, 1              

    ; Step 3: Multiply (1 + 2) * (3 - 1)
    MUL BL                 

    ; Step 4: Divide by 5
    MOV CL, 5              
    MOV AH, 0              
    DIV CL                 

    ; Step 5: Add 3 and then add 2
    ADD AL, 3              
    ADD AL, 2              

    ; Step 6: Subtract (1 * 2)
    MOV DL, 1              
    MUL DL                 
    SUB AL, DL             

    ; Display result
    ADD AL, 30H            
    MOV DL, AL             
    MOV AH, 02H           
    INT 21H                

    ; Exit program
    MOV AH, 4CH            
    INT 21H                

MAIN ENDP
END MAIN
