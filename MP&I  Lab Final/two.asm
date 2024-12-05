.MODEL SMALL
.STACK 100H
.DATA   

result dw ?

.CODE
MAIN PROC
    MOV AX,@data
    MOV DS,AX
    
    MOV AX,6
    MOV BX,8
    MUL BX
    
    MOV CX,2
    MOV DX,3
    MUL DX
    
    MOV AX, 24
    MOV BX,2
    DIV BX     
    
    MOV CX,12
    MOV DX,5
    MUL DX
    
    
    
    ADD AX,CX
    SUB AX,
    
    MOV BX,48
    SUB BX,AX
    
              
              
    MOV result,BX
    
    MOV AH,4ch
    INT 21h

main endp
end main
