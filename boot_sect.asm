
;
; A boot sector that prints a string using our function.
;
[org 0x7c00] ; Tell the assembler where this code will be loaded

mov[BOOT_DRIVE], dl

mov bp, 0x8000
mov sp, bp

mov bx, HELLO_MSG ; Use BX as a parameter to our function , so
call print_string ; we can specify the address of a string.

mov bx, GOODBYE_MSG
call print_string

mov bx, 0x9000
mov dh, 2
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]
call print_hex

mov dx, [0x9000 + 512]
call print_hex

mov dx, 0x1fb6
call print_hex

jmp $ ; Hang

%include "print_string.asm"
%include "print_hex.asm"
%include "disk_load.asm"

; Data
HELLO_MSG:
db "Hello, World! " , 0 ; <-- The zero on the end tells our routine

; when to stop printing characters.
GOODBYE_MSG:
db "Goodbye!", 0

BOOT_DRIVE: db 0 
; Padding and magic number.
times 510-( $ - $$ ) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
