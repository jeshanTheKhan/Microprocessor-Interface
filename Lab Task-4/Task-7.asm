;Write an assembly program to check whether a number is even or odd.

.MODEL SMALL
.STACK 100H
.DATA
    prompt_msg DB 'Enter a number: $'
    even_msg DB 'The number is even.$'
    odd_msg DB 'The number is odd.$'
    newline DB 0DH, 0AH, '$'
    number DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, prompt_msg
    MOV AH, 9
    INT 21H

    ; Read number
    MOV AH, 1
    INT 21H
    SUB AL, '0'  ; Convert ASCII to number
    MOV AH, 0    ; Clear AH
    MOV number, AX

    ; Print newline
    LEA DX, newline
    MOV AH, 9
    INT 21H

    ; Check if even or odd
    MOV AX, number
    MOV BL, 2
    DIV BL       ; Divide by 2
    
    CMP AH, 0    ; Check remainder
    JE EVEN

    ; If odd
    LEA DX, odd_msg
    JMP PRINT

EVEN:
    LEA DX, even_msg

PRINT:
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN