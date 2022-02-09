assume cs:code,ds:data 
data segment
    STR db '21961146612196114661$' 
    COUNT dw 10 dup(0000H)
    crlf db 0AH,0DH,'$'
    result	db'result',0Ah,0Dh,'$'
    highest db'highest',0Ah,0Dh,'$'
data ends 
code segment
    main proc 
    mov ax,data 
    mov ds,ax
    mov si,offset STR 
loop1:
    xor ax,ax 
    mov al,[si] 
    cmp al,'$'
    je short loop1_end 
    cmp al,'0'
    jb skip 
    cmp al,'9' 
    ja skip 
    sub al,'0' 
    mov di,ax 
    shl di,1
    inc word ptr COUNT[di] 
skip:
    inc si
    jmp short loop1
 
loop1_end:
    mov dx, offset result 
    mov ah, 09H
    int 21H
    mov dx, offset highest 
    int 21H
    xor bx, bx 
    xor di, di
loop2:
    cmp bx, 10 
    jnb loop2_end 
    mov si, bx 
    shl si, 1
    mov cx, COUNT[si] 
    cmp cx, COUNT[di] 
    jb short skip_max 
    mov di, si
skip_max: 
    mov dl, bl 
    add dl, '0'
skip2:
    inc bx
    jmp short loop2 
loop2_end:
    mov dx, di 
    shr dx, 1 
    xor dh, dh 
    add dl, '0' 
    mov ah, 02H 
    int 21H
    mov dl, ',' 
    int 21H
    mov ax, COUNT[di] 
    cmp ax, 10
    jb short re_end 
re_end:
    xor ah,ah 
    mov dl, al 
    add dl, '0' 
    mov ah, 02H 
    int 21H
    mov dx, offset crlf 
    mov ah, 09H
    int 21H
    mov ax, 4C00H 
    int 21H
    main endp 
code ends 
end main
