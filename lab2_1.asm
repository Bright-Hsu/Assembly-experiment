data segment
    M  dw  21h,96h,11h,46h,61h,4 DUP(05h,10h,15h)
	len  dw  ($-M)/2
    max DW ?
    pos DW ?
data ends

code segment
    assume cs:code, ds:data
    main    proc
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
        
		mov si,0
		mov cx,len 
		mov ax,0  ;ax用于存最大值，初始化为0
		lea bx,M
	rotate:
	    mov dx,M[si]
	    cmp dx,0
		js minus
		jmp compare
	minus:
		neg dx
		jmp compare
	compare:
	    cmp ax,dx
		js  bigger
	return:
    	add si,2
		loop rotate 
		jmp exit
	bigger:
		mov ax,dx
		lea bx,M[si]
		jmp return
	exit:
		mov M[si],ax
		mov M[si+2],bx
		
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 