;Take a character input and display it. Display the message "Please insert a
;character: " when taking an input.

.MODEL SMALL
.STACK 100H
.DATA
    PROMPT_MSG DB 'Please insert a character: $' 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX             ; Initialize data segment

    ; Display prompt message
    MOV DX, OFFSET PROMPT_MSG
    MOV AH, 09H            ; Function to display string
    INT 21H

    ; Take a character input
    MOV AH, 01H            ; Function to read character
    INT 21H
    MOV BL, AL             ; Store character in BL for later use

       
     MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
      
    ; Display the entered character
    MOV DL, BL             ; Move character from BL to DL
    MOV AH, 02H            ; Function to display character
    INT 21H

    ; Exit program
    MOV AH, 4CH            ; Function to terminate program
    INT 21H
MAIN ENDP
END MAIN
