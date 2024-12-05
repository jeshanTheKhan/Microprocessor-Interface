;Write a program to input any alphabet and check whether it is vowel or
;consonant.

.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter an alphabet: $'
    VOWEL_MSG DB 'The entered character is a vowel.$'
    CONSONANT_MSG DB 'The entered character is a consonant.$'
    INVALID_MSG DB 'Invalid input. Please enter an alphabet.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

    ; Read character
    MOV AH, 1
    INT 21H
    MOV BL, AL  ; Store input in BL

    ; New line
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Convert to uppercase if lowercase
    CMP BL, 'a'
    JB CHECK_VOWEL
    CMP BL, 'z'
    JA CHECK_VOWEL
    SUB BL, 32  ; Convert to uppercase

CHECK_VOWEL:
    ; Check if it's an alphabet
    CMP BL, 'A'
    JB INVALID
    CMP BL, 'Z'
    JA INVALID

    ; Check if vowel
    CMP BL, 'A'
    JE VOWEL
    CMP BL, 'E'
    JE VOWEL
    CMP BL, 'I'
    JE VOWEL
    CMP BL, 'O'
    JE VOWEL
    CMP BL, 'U'
    JE VOWEL

    ; If not vowel, it's a consonant
    LEA DX, CONSONANT_MSG
    JMP DISPLAY

VOWEL:
    LEA DX, VOWEL_MSG
    JMP DISPLAY

INVALID:
    LEA DX, INVALID_MSG

DISPLAY:
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN