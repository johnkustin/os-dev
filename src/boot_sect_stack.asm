;
;   a simple boot sector program that demonstrates the stack
;

mov ah, 0x0e    ;   invoke the ISR handler for scrolling teletype BIOS routine

mov bp, 0x8000  ;   set the base of the stack a little above where BIOS loads
mov sp, bp      ;   our boot sector (@ 0x7c00) - so it won't overwrite us

push 'A'        ;   Push some characters on the stack for later
push 'B'        ;   retreival. Note , these are pushed on as
push 'C'        ;   16- bit values , so the most significant byte
                ;   will be added by our assembler as 0x00.

pop bx          ;   since pop/push works w/ 16-bit values we must also
mov al, bl      ;   only move the lower 8-bits of bx (referred as bl) to al
int 0x10        ;   print(al)

pop bx          ;   pop the next value into bx
mov al, bl      ;   same procedure as above
int 0x10

mov al, [0x7ffe]    ;   to prove the stack grows downwards from bp,
                    ;   fetch the char at 0x8000 - 0x2 (i.e. 16-bits, or
int 0x10            ;   two characters worth)

jmp $

; padding and BIOS number
times 510-($-$$) db 0   ;   $ is current address. $$ address of start of
dw 0xaa55               ;   current section

