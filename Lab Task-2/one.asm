;Perform the following arithmetic operations:

.MODEL SMALL
.STACK 100H
.DATA  
    X DB 20H                  
    Y DB 02H              
    Z DB 10H                  
    MSG1 DB "Result of X * Y = $"
    MSG2 DB "Result of X / Y = $"   
    MSG3 DB "Result of X * Y / Z = $"
    NEWLINE DB 13, 10, "$"    
    RESULT DB ?               
.CODE

MAIN PROC
    MOV AX, @DATA             
    MOV DS, AX

    ; Display message for multiplication
    MOV DX, OFFSET MSG1
    MOV AH, 09H             
    INT 21H

    ; Multiply X * Y
    MOV AL, X                 
    MOV BL, Y                 
    MUL BL                   

    ; Store result and convert to ASCII
    MOV RESULT, AL            
    ADD RESULT, 30H           

    ; Display multiplication result
    MOV DL, RESULT            
    MOV AH, 02H               
    INT 21H

    ; New line after multiplication result
    MOV DX, OFFSET NEWLINE
    MOV AH, 09H
    INT 21H

    ; Display message for division
    MOV DX, OFFSET MSG2
    MOV AH, 09H
    INT 21H

    ; Division operation X / Y
    MOV AL, X                
    MOV BL, Y                 
    MOV AH, 00H              
    DIV BL                    

    ; Store result and convert to ASCII
    MOV RESULT, AL          
    ADD RESULT, 30H          

    ; Display division result
    MOV DL, RESULT            
    MOV AH, 02H               
    INT 21H 
    
     
    MOV DX, OFFSET NEWLINE
    MOV AH, 09H
    INT 21H
    
    ;X*/Y 
    
     ; Display message for division
    MOV DX, OFFSET MSG3
    MOV AH, 09H
    INT 21H

    ; Multiply operation X / Y
    MOV AL, X                
    MOV BL, Y               
    MUL BL
    
    ; Multiply operation X / Y*Z     
    MOV CL, Z
    MOV AH, 00H
    DIV CL               

    ; Store result and convert to ASCII
    MOV RESULT, AL          
    ADD RESULT, 30H          

    ; Display division result
    MOV DL, RESULT            
    MOV AH, 02H               
    INT 21H 
    

    ; Program exit
    MOV AH, 4Ch               
    INT 21H

MAIN ENDP
END MAIN
