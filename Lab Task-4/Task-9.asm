;Write a program to check whether a number is divisible by 5 and 11 or not.

.MODEL SMALL
.STACK 100H
.DATA
    NUM DW ?
    MSG1 DB 'Enter a number: $'
    MSG2 DB 'The number is divisible by 5 and 11.$'
    MSG3 DB 'The number is not divisible by 5 and 11.$'
    NEWLINE DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Read number
    CALL READ_NUM
    MOV NUM, AX

    ; Check divisibility by 5
    MOV DX, 0
    MOV AX, NUM
    MOV BX, 5
    DIV BX
    CMP DX, 0
    JNE NOT_DIVISIBLE

    ; Check divisibility by 11
    MOV DX, 0
    MOV AX, NUM
    MOV BX, 11
    DIV BX
    CMP DX, 0
    JNE NOT_DIVISIBLE

    ; If divisible by both 5 and 11
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    JMP EXIT

NOT_DIVISIBLE:
    ; If not divisible by both 5 and 11
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

READ_NUM PROC
    ; Read a number from keyboard and return it in AX
    MOV AX, 0
    MOV CX, 0

READ_LOOP:
    MOV AH, 1
    INT 21H
    CMP AL, 0DH  ; Check for Enter key
    JE END_READ
    SUB AL, '0'  ; Convert ASCII to number
    MOV CL, AL
    MOV AX, 10
    MUL BX       ; Multiply existing number by 10
    ADD AX, CX   ; Add new digit
    MOV BX, AX
    JMP READ_LOOP

END_READ:
    MOV AX, BX
    RET
READ_NUM ENDP

END MAIN