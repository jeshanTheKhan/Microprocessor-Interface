;a. Read two decimal digits whose sum is less than 10,
;b. Display them and their sum on the next line, with an appropriate
message.

.MODEL SMALL
.STACK 100H
.DATA          
    ; DATA SECTION
    NUM1 DB ?             ; Store first digit
    NUM2 DB ?             ; Store second digit
    RESULT DB ?           ; Store result (sum)
    MSG DB 'Sum is 10 or more, please try again.$'
    MSG1 DB 'Enter the first digit: $'
    MSG2 DB 'Enter the second digit: $'
    RESULT_MSG DB 'The sum of '        
    AND_MSG DB ' and '        
    IS_MSG DB ' is $'

.CODE
MAIN PROC
    ; Initialize DS register
    MOV AX, @DATA
    MOV DS, AX   

    ; Read first digit
    MOV AH, 01H           
    INT 21H
    SUB AL, 30H            
    MOV NUM1, AL           


    ; Read second digit
    MOV AH, 01H           
    INT 21H
    SUB AL, 30H            
    MOV NUM2, AL           
    
    ; Display newline
    MOV DL, 0DH          
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH          
    INT 21H

    ; Add the two numbers
    MOV AL, NUM1          
    ADD AL, NUM2          
    MOV RESULT, AL        

    ; Check if sum is less than 10
    CMP RESULT, 0AH
    JAE ERROR             

    ; Display result message
    MOV DX, OFFSET RESULT_MSG
    MOV AH, 09H
    INT 21H   
    
    ; Display first number
    MOV AL, NUM1
    ADD AL, 30H           
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Display " and " message
    MOV DX, OFFSET AND_MSG
    MOV AH, 09H
    INT 21H

    ; Display second number
    MOV AL, NUM2
    ADD AL, 30H           
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Display " is " message
    MOV DX, OFFSET IS_MSG
    MOV AH, 09H
    INT 21H

    ; Display the result (sum)
    MOV AL, RESULT
    ADD AL, 30H           
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    JMP EXIT              

ERROR:
    ; Display error message if sum >= 10
    MOV DX, OFFSET MSG
    MOV AH, 09H    
    INT 21H        

EXIT:
    ; Exit program
    MOV AH, 4CH           
    INT 21H

MAIN ENDP
END MAIN
