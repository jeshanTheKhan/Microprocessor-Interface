;a. Prompt the user
;b. Read first, middle, and last initials of a person's name, and then
;c. Display them down the left margin.

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter Three Initials: $'           

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX           

   
    MOV DX, OFFSET MSG1
    MOV AH, 09H
    INT 21H

    ; Read first initial
    MOV AH, 01H        
    INT 21H              
    MOV BL, AL           

    ; Read middle initial
    MOV AH, 01H
    INT 21H             
    MOV BH, AL          

    ; Read last initial
    MOV AH, 01H
    INT 21H             
    MOV CL, AL 
                      
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    ; Display initials down the left margin
    MOV DL, BL           
    MOV AH, 02H          
    INT 21H      
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    MOV DL, BH           ; Load middle initial
    MOV AH, 02H          
    INT 21H    
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    MOV DL, CL           ; Load last initial
    MOV AH, 02H          
    INT 21H     
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
