print_string:
    pusha           ;   push all registers to stack, for convenience
    mov ah, 0x0e    ;   prep ISR for BIOS teletype output

    body:
        mov al, [bx]    ;   move the contents of bx (a character) into reg al
        cmp al, 0       ;   test for null character
        je exit       ;   if the value in al register is 0 then we are done
        int 0x10        ;   print the char in al
        add bx, 0x1       ;   increment the address in bx by 1 char
        jmp body

    exit:
        popa
        ret
