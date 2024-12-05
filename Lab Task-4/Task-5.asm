;Read a character, and if it's an uppercase letter, display it.

.model small
.stack 100h

.data
    prompt db 'Enter a character: $'  ; Prompt for input
    newline db 0Ah, 0Dh, '$'          ; Newline for output

.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt to user
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Read character from user input
    mov ah, 01h         ; Function to read a single character from the keyboard
    int 21h             ; Get input character (stored in AL)

    ; Check if the character is an uppercase letter
    mov bl, al          ; Copy input character to BL for comparison
    cmp bl, 'A'         ; Compare with 'A'
    jl not_uppercase    ; If the character is less than 'A', it's not uppercase
    cmp bl, 'Z'         ; Compare with 'Z'
    jg not_uppercase    ; If the character is greater than 'Z', it's not uppercase     
    
    

    ; If it is an uppercase letter, display it
    mov ah, 02h         ; Function to display character in DL
    mov dl, al          ; Move character from AL to DL for printing
    int 21h

not_uppercase:
    ; Exit program
    mov ah, 4Ch
    int 21h

end main