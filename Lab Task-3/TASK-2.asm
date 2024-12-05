;Perform addition/subtraction/division/multiplication by taking inputs from
;the user. Note: Display appropriate messages when taking input and showing the

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Enter First Number (0-9): $'
    MSG2 DB 'Enter Second Number (0-9): $'
    MSG3 DB 'Enter operation (1=Add, 2=Subtract, 3=Multiply, 4=Divide): $'
    RESULT_MSG DB 'Result: $'
    DIV_ZERO_MSG DB 'Error: Division by zero! $'
    NUM1 DB ?            
    NUM2 DB ?           
    OPERATION DB ?         
    RESULT DW 0           
    NEGATIVE_FLAG DB 0    

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX 

    ; Prompt for First Number
    MOV DX, OFFSET MSG1
    MOV AH, 09H
    INT 21H

    ; Read First Number
    MOV AH, 01H
    INT 21H
    SUB AL, '0'           
    MOV NUM1, AL          

    CALL NEWLINE      

    ; Prompt for Second Number
    MOV DX, OFFSET MSG2
    MOV AH, 09H
    INT 21H

    ; Read Second Number
    MOV AH, 01H
    INT 21H
    SUB AL, '0'           ; Convert ASCII to integer
    MOV NUM2, AL          

    CALL NEWLINE          ; Print a newline

    ; Prompt for Operation
    MOV DX, OFFSET MSG3
    MOV AH, 09H
    INT 21H

    ; Read Operation Code
    MOV AH, 01H
    INT 21H
    SUB AL, '0'           
    MOV OPERATION, AL

    CALL NEWLINE          ; Print a newline

    ; Perform Operation
    MOV AL, NUM1          
    MOV BL, NUM2          
    MOV NEGATIVE_FLAG, 0 

    CMP OPERATION, 1
    JE ADDITION
    CMP OPERATION, 2
    JE SUBTRACTION
    CMP OPERATION, 3
    JE MULTIPLICATION
    CMP OPERATION, 4
    JE DIVISION
    JMP END_PROGRAM      

ADDITION:
    ADD AL, BL
    MOV RESULT, AX        ; Store the result
    JMP DISPLAY_RESULT

SUBTRACTION:
    CMP AL, BL
    JAE SUB_POSITIVE      ; If AL >= BL, result is positive
    ; Result is negative
    SUB BL, AL            ; Compute negative result
    MOV NEGATIVE_FLAG, 1  ; Set Negative Flag
    MOV AL, BL            ; Store result in AL
    JMP SUB_DONE

SUB_POSITIVE:
    SUB AL, BL
SUB_DONE:
    MOV RESULT, AX       
    JMP DISPLAY_RESULT

MULTIPLICATION:
    MOV AH, 0            
    MUL BL                
    MOV RESULT, AX        
    JMP DISPLAY_RESULT

DIVISION:
    CMP BL, 0
    JE DIVISION_BY_ZERO   
    MOV AH, 0            
    DIV BL               
    MOV RESULT, AX        
    JMP DISPLAY_RESULT

DIVISION_BY_ZERO:
    MOV DX, OFFSET DIV_ZERO_MSG
    MOV AH, 09H
    INT 21H
    JMP END_PROGRAM       

DISPLAY_RESULT:
    ; Display Result Message
    MOV DX, OFFSET RESULT_MSG
    MOV AH, 09H
    INT 21H

    ; Handle Negative Result
    CMP NEGATIVE_FLAG, 1
    JNE DISPLAY_POSITIVE  ; If not negative, skip
    MOV DL, '-'           ; Display negative sign
    MOV AH, 02H
    INT 21H

DISPLAY_POSITIVE:
    ; Display Decimal Result
    MOV AX, RESULT
    CALL DISPLAY_DECIMAL
    JMP END_PROGRAM

DISPLAY_DECIMAL PROC
 
    ; Convert and display the result in decimal
    MOV CX, 0             

DECIMAL_LOOP:
    MOV DX, 0             
    DIV WORD PTR 10       
    PUSH DX               
    INC CX                
    CMP AX, 0             
    JNE DECIMAL_LOOP     

DISPLAY_DIGITS:
    POP DX               
    ADD DL, '0'           
    MOV AH, 02H          
    INT 21H
    LOOP DISPLAY_DIGITS   
    RET
DISPLAY_DECIMAL ENDP

NEWLINE PROC
    MOV DL, 0DH           
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH           
    INT 21H
    RET
NEWLINE ENDP

END_PROGRAM:
    ; Exit the program
    MOV AH, 4CH
    INT 21H


END MAIN