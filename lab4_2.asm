data segment
    maxlen db 11
	actlen db ?
	buffer db 10 dup(?)
    id db '2196114661'
	table db 7,5,9,1,3,6,8,0,2,4
data ends

code segment
    assume cs:code, ds:data
    main    proc
        mov   ax, data
        mov   ds, ax
        
		lea dx,maxlen
		mov ah,0Ah
		int 21h
		
		mov cx,10
		lea bx,table 
		mov di,0
	rotate:
	    mov al,buffer[di]
		sub al,'0'
		xlat
		mov buffer[di],al
		inc di
		loop rotate
        
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 