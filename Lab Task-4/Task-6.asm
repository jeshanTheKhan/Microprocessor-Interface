;Read a character. If it's "y" or "Y", display it; otherwise, terminate the
;program.

.model small
.stack 100h

.data
    prompt db 'Enter a character: $'   
    newline db 0Ah, 0Dh, '$'          

.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt to user
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Read a character from user input
    mov ah, 01h      
    int 21h          

    ; Compare the input with 'y' or 'Y'
    cmp al, 'y'      
    je display_char  
    cmp al, 'Y'      
    je display_char  

    ; If not 'y' or 'Y', terminate the program
    jmp exit_program

display_char:
    ; Display the character
    mov ah, 02h      
    mov dl, al    
    int 21h          

    ; Print newline after displaying the character
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Exit program
exit_program:
    mov ah, 4Ch      ; Terminate program
    int 21h

end main