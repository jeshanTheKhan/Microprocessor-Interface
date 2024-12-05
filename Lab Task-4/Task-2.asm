;Suppose AL and BL contain extended ASCII characters. Display the one that
;comes first in the character sequence.

.MODEL SMALL
.STACK 100H
.DATA               
    msg0 DB 'Character in AL & BL is equal: $'
    msg1 DB 'Character in AL comes first: $'
    msg2 DB 'Character in BL comes first: $'
    AL_char DB ?
    BL_char DB ?

.CODE
MAIN PROC
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Example characters in AL and BL
    MOV AL, 'E'   
    MOV BL, 'E'   

    ; Save values for display later
    MOV AL_char, AL
    MOV BL_char, BL

    ; Compare AL and BL
    CMP AL, BL     
    JE EQUAL      ;If AL == BL
    JL AL_FIRST   ; If AL < BL, jump to AL_FIRST
    JG BL_FIRST   ; If AL > BL, jump to BL_FIRST

EQUAL:
   LEA DX, msg0   
    MOV AH, 09H    
    INT 21H

    MOV DL, AL_char 
    MOV AH, 02H     
    INT 21H
    JMP END_PROGRAM ; End the program 
  
  
AL_FIRST:
    LEA DX, msg1   
    MOV AH, 09H    
    INT 21H

    MOV DL, AL_char
    MOV AH, 02H     
    INT 21H
    JMP END_PROGRAM 

BL_FIRST:
    LEA DX, msg2   
    MOV AH, 09H    
    INT 21H

    MOV DL, BL_char 
    MOV AH, 02H     
    INT 21H

END_PROGRAM:
    MOV AH, 4CH    
    INT 21H     
    
MAIN ENDP
END MAIN