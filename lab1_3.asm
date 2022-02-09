; empty asm file

title Xu Liang love asm

data segment
    stu db "2196114661"
    X  db  15H
    Y  db  21H
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
        ; TODO ...
		; | add your code between arrows |
		; v ---------------------------- v
        mov bl, X
        mov cl, Y 
        mov al, bl 
        cbw
        div cl 
        mov bl, 02h
        mul bl 
        mov dx, ax 
        
        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 