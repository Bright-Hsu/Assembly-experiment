; lab1_2 asm file

title Xu Liang love asm

data segment
    stu  db  "2196114661"
    X  db  15H
    Y  db  10H
    Z  db  ?
    W  db  21H
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
        mov al, W
        sub al, X 
        cbw
        mov cl, 05h
        idiv cl 
        imul Y 
        mov ch, 02h
        idiv ch 
        mov Z, al 

        ; ^ ---------------------------- ^
		; |          The END             |
        
        ; method 2: return to dos
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 