print_hex:
    pusha

    ; The output buffer starts as "0x0000". We fill the 4 digit slots
    ; from right to left (lowest nibble first), then print the string.
    mov cx, 4              ; A 16-bit value has exactly 4 hex digits.
    mov bx, HEX_OUT + 5    ; Point to the last digit in "0x0000".

hex_loop:
    mov al, dl             ; Take the low byte of DX into AL explicitly.
    and al, 0x0f           ; Keep only the lowest 4 bits (one hex digit).

    ; Convert nibble value (0..15) into ASCII.
    cmp al, 9
    jbe hex_is_decimal

    ; 10..15 -> 'A'..'F'
    add al, 'A' - 10
    jmp hex_store

hex_is_decimal:
    ; 0..9 -> '0'..'9'
    add al, '0'

hex_store:
    mov [bx], al           ; Write ASCII character into template.
    dec bx                 ; Move left to the next digit slot.
    shr dx, 4              ; Bring the next nibble into the low 4 bits.
    loop hex_loop

    mov bx, HEX_OUT
    call print_string

    popa
    ret

HEX_OUT: db "0x0000", 0