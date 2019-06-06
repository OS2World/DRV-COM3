
; COMINIT.ASM - Device driver to Iinit low memory for COM3 serial interface
;
; CAVEAT EMPTOR - this driver is trash!  Do not use it as an example of
;	how to write OS/2 device drivers - it is strictly a hack to solve
;	a very simple problem as is documented in the accompanying text.

	  .286c   

data segment word public 'data'

header		  equ  $
ptr_to_nxt_hdr	  dw   0ffffh
		  dw   -1
device_attr	  dw   88h
offst		  dw   dcode:strat
reserved	  dw   -1
named		  db   'com_init'
reserved_words	  dw   4 dup (0)

data ENDS


dcode	  segment  word public 'code'
	  assume cs:dcode,ds:data

strat	proc far 

	push ax
	push es
	push di

	cld
	mov  ax, 40h
	mov  es, ax
	mov  di, 2

	mov  ax, 1f8h
	stosw

	pop  di
	pop  es
	pop  ax

	mov	  word ptr es:[bx]+14,0
	mov	  word ptr es:[bx]+16,0
	ret

strat	endp
dcode 	ends
	end
