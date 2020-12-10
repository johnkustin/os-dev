;
; a boot sector which prints a message to the screen using a BIOS routine
;

mov ah, 0x0e ; 0eh -> scrolling teletype BIOS routine

mov AL, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

jmp $ ; jump to current address (inf loop)

;
; padding and magic BIOS number
;

times 510-($-$$) db 0 ; pad the boot sector with zeros

dw 0xaa55 ; last two bytes are magic number to determine this is a boot sector
