func  macro
    if  len le 5
	    rept len
		    add ax,ax
		endm 
	else
	    rept 6
		    add ax,ax
	    endm 
	endif
	  endm
data segment
    id  db  '2196114661'
	;X  label  byte
	;X   db  '14661'
	X   db  '2196114661'
	len equ ($-X)
data ends
code segment
    assume cs:code, ds:data
    main    proc
        mov   ax, data
        mov   ds, ax
        mov ax,1
		func
        mov   ax, 4c00h
        int   21h
    main    endp
code ends
end main 