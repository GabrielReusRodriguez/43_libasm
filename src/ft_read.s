default	rel

;ssize_t read(int fd, void buf[.count], size_t count);
global	ft_read
extern __erno_location

section	.text
;Recuerda, 
;	RDI 1r arg
;	RSI 2o arg
;	RDX 3r arg
;	RCX 4o arg
;	RAX retorno.

; La syscall en linux de read es: 0

ft_read:
; Pre-subrutine.
	
; Subrutina
	MOV		rax, 0
	SYSCALL
	TEST	rax, rax
	JS error
	JMP return

error:
; Post-subrutina
	MOV		rdi, rax
	CALL	[rel __erno_location wrt ..got] ; Utilizamos la @ de memoria relativa del símbolo en la tabla got.
	MOV		[rax], rdi
	MOV		rax, -1
return:
RET