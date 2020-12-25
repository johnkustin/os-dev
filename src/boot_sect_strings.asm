;
;   a boot sector that prints a string using our print function
;

[org 0x7c00]    ;   tell nasm where this code will be loaded


mov bp, 0x8000
mov sp, bp

mov bx, HELLO_MSG   ;   bx is a parameter for the print function
call print_string   ;   so we can specify the address of a string

mov bx, GOODBYE_MSG
call print_string

mov dx, 0x1fb6
call print_hex

jmp $

%include "print_hex.asm"

%include "print_string.asm"

; data
HELLO_MSG:
    db 'Hello, World!', 0 ; 0 is for null terminzation
GOODBYE_MSG:
    db 'Goodbye!', 0 ; 

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
