data segment
    id  db  '2196114661'
	array  db  76,69,84,90,73,88,99,63,100,80
	s6  db  0
	s7  db  0
	s8  db  0
	s9  db  0
	s10  db  0
data ends

code segment
    assume cs:code, ds:data
    main    proc  far
        ; assign the data segment base address to DS
        mov   ax, data
        mov   ds, ax
		mov cx,10
		lea bx,array
    rotate:
	    mov al,[bx]
		call count
		inc  bx
		loop rotate
        mov   ax, 4c00h
        int   21h
    main    endp
	
	count  proc  near
		cmp  al,100
		jz   score100
		cmp  al,60
		js   exit
		cmp  al,70
		js   score60
		cmp  al,80
		js   score70
		cmp  al,90
		js   score80
		jmp  score90
	    ret
	score100:	
		inc  s10
		ret
	score90:	
		inc  s9
		ret
	score80:	
		inc  s8
		ret
	score70:
		inc  s7
		ret
	score60:
		inc  s6
		ret
	exit:
	    ret
	count  endp 
code ends
end main 