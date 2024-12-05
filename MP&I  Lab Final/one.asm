.MODEL SMALL
.STACK 100H
.DATA
    inputChar DB ?        
    msgUpper DB "uppercase.$"
    msgLower DB "lowercase.$"
    newline DB 13, 10, '$' 

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

  
    MOV AH, 01H         
    INT 21H              
    MOV inputChar, AL   

    ; Print a newline
    MOV AH, 09H
    LEA DX, newline
    INT 21H

    ; Check if character is uppercase
    MOV AL, inputChar    
    CMP AL, 'A'          
    JB not_upper        
    CMP AL, 'Z'          
    JA not_upper         

    ; Print "uppercase" message
    MOV AH, 09H
    LEA DX, msgUpper
    INT 21H
    JMP done             

not_upper:
    ; Check if character is lowercase
    CMP AL, 'a'          
    JB done             
    CMP AL, 'z'         
    JA done              

    ; Print "lowercase" message
    MOV AH, 09H
    LEA DX, msgLower
    INT 21H

done:
    ; Exit program
    MOV AH, 4CH          
    INT 21H

MAIN ENDP
END MAIN
                              
