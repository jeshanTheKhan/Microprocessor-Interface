;If AL contains 1 or 3, display “o”; if AL contains 2 or 4 display "e".

.model small
.stack 100h

.data
    msg1 db 'Enter a value for AL (1-4): $'
    msg_o db 'o$'
    msg_e db 'e$'
    
.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt message
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Get input from user
    mov ah, 01h  
    int 21h
    sub al, '0'   

 
    cmp al, 1
    je display_o
    cmp al, 3
    je display_o
    cmp al, 2
    je display_e
    cmp al, 4
    je display_e   
    
    

    ; If no valid input, just terminate
    jmp exit
    
    

display_o:    

   MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ; Display "o"
    mov ah, 09h
    lea dx, msg_o
    int 21h
    jmp exit

display_e:  
   MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ; Display "e"
    mov ah, 09h
    lea dx, msg_e
    int 21h
    jmp exit

exit:
    ; Exit program
    mov ah, 4Ch
    int 21h
end main