;b. Read an uppercase letter, and display it at the next position on the
;same line in lower case.

.MODEL SMALL
.STACK 100H
.DATA 
    MSG DB 'Enter an uppercase letter: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; Read a single character
    MOV AH, 1
    INT 21H

    ; Convert uppercase letter to lowercase
    ADD AL, 32  ; Convert to lowercase by adding 32 to ASCII

   
    
    ; Display the lowercase letter
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
