;
; a simple boot sector program that demonstrates addressing
;

[org 0x7c00] ; tells assembler where we expect the code to be loaded into memory.
             ; removes the need to manually account for offsets 

mov ah, 0x0e ; prep for scrolling teletype BIOS routine

; first attempt
mov al, the_secret
int 0x10

; second attempt
mov al, [the_secret] 
int 0x10

; third attempt
mov bx, the_secret
add bx, 0x7c00 ; 0x7c00 is loaded boot sector offset
mov al, [bx]
int 0x10

; fourth attempt
mov al, [0x7c1e]
int 0x10

jmp $

the_secret:
    db "X"

; padding and magic BIOS number

times 510-($-$$) db 0
dw 0xaa55
