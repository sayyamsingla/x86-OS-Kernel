print_string:
    pusha

loop:
    mov al, [bx]
    cmp al, 0
    je exit
    mov ah, 0x0e
    int 0x10
    inc bx
    jmp loop

exit:
    popa
    ret