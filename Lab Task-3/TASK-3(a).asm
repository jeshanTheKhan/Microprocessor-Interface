;a. Read a character, and display it at the next position on the same
;line.

.MODEL SMALL
.STACK 100H
.DATA
    PROMPT_MSG DB 'Please insert a character: $' 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX             

    ; Display prompt message
    MOV DX, OFFSET PROMPT_MSG
    MOV AH, 09H            
    INT 21H

    ; Take a character input
    MOV AH, 01H            
    INT 21H
    MOV BL, AL            

      
      
    ; Display the entered character
    MOV DL, BL             
    MOV AH, 02H            
    INT 21H

    ; Exit program
    MOV AH, 4CH          
    INT 21H
MAIN ENDP
END MAIN
