;dx holds the hex value to be converted into a string
HEX_OUT: db '0x0000', 0     ;hex template

print_hex:
    pusha
    mov cx, 0 ;index variable

loop:
    cmp cx, 4 ;loop 4 times
    je end

    mov ax, dx
    and ax, 0xf ;get last digit
    add al, 0x30 ;convert to ASCII
    cmp al, 0x39 ;if >9, add extra 8 to represent letters
    jle populate
    add al, 7 ;'A' is ascii 65 instead of 58. need offset of 7

populate:
    mov bx, HEX_OUT + 5; base + (str length) - index
    sub bx, cx
    mov [bx], al ;copy ascii char
    ror dx, 4; rotate the num so we can get all digits

    add cx, 1
    jmp loop
end:
    mov bx, HEX_OUT
    call print_string

    popa
    ret
