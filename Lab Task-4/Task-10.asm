;Write a program to find the maximum and minimum between three
;numbers.

.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter three numbers: $'
    max_msg DB 0DH,0AH,'Maximum number is: $'
    min_msg DB 0DH,0AH,'Minimum number is: $'
    num1 DB ?
    num2 DB ?
    num3 DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display prompt
    LEA DX, prompt
    MOV AH, 9
    INT 21H
    
    ; Input first number
    MOV AH, 1
    INT 21H
    SUB AL, 30H  ; Convert from ASCII
    MOV num1, AL
    
    ; Input space (ignore)
    MOV AH, 1
    INT 21H
    
    ; Input second number
    MOV AH, 1
    INT 21H
    SUB AL, 30H  ; Convert from ASCII
    MOV num2, AL
    
    ; Input space (ignore)
    MOV AH, 1
    INT 21H
    
    ; Input third number
    MOV AH, 1
    INT 21H
    SUB AL, 30H  ; Convert from ASCII
    MOV num3, AL
    
    ; Find maximum
    MOV AL, num1
    CMP AL, num2
    JGE CHECK_NUM3_MAX
    MOV AL, num2
    
CHECK_NUM3_MAX:
    CMP AL, num3
    JGE FOUND_MAX
    MOV AL, num3
    
FOUND_MAX:
    MOV BL, AL  ; Store max in BL
    
    ; Find minimum
    MOV AL, num1
    CMP AL, num2
    JLE CHECK_NUM3_MIN
    MOV AL, num2
    
CHECK_NUM3_MIN:
    CMP AL, num3
    JLE FOUND_MIN
    MOV AL, num3
    
FOUND_MIN:
    MOV BH, AL  ; Store min in BH
    
    ; Display maximum
    LEA DX, max_msg
    MOV AH, 9
    INT 21H
    
    MOV DL, BL
    ADD DL, 30H  ; Convert to ASCII
    MOV AH, 2
    INT 21H
    
    ; Display minimum
    LEA DX, min_msg
    MOV AH, 9
    INT 21H
    
    MOV DL, BH
    ADD DL, 30H  ; Convert to ASCII
    MOV AH, 2
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN