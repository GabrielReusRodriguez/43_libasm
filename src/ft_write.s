default rel
;https://stackoverflow.com/questions/52126328/cant-call-c-standard-library-function-on-64-bit-linux-from-assembly-yasm-code/52131094#52131094
global ft_write
extern __errno_location

; extern ___errno
section     .text

;Hemos de llamar syscalls y para ellos tenemos que:
;   Poner en eax el número de la syscall
;   Llamar int 0x80 <= Llamada al kernel.
;   Configurar los registros segun los usemos para cada syscall RECUERDA la callee saved call convention.

; Caso del write 
;   EAX 4
;   EBX file descriptor
;   ECX char * a escribir
;   EDX message length

;Recuerda:
;   RDI primer arg
;   RSI Segundo arg
;   RDX Tercer arg
;   RCX Cuarto arg


;Otra opcion es colocar la llamada en rax y llamar syscall. 
;	Syscall se encarga de pasarle el rdi, rsi rcx y rdx que como viene de la llamada wrapper de c, ya están bien colocados.
ft_write:

; Pre-subrutina
	
; Subrutina
	MOV		rax, 1				; En linux write es la system call 1.
	SYSCALL
	TEST	rax, rax 		; Pone el flag SF a 1 si rax es negativo   (test coloca en SF el bit de máximo peso) y como es complemento a 2, es el bit de signo.
	JS		error			; Salta si el bit de signo está marcado ( = 1)
	JMP		return

error:
	NEG		rax					;Obtenemos el valor absoluto del retorno del syscall 
	MOV		rdi, rax			;El valor de rax se lo pasamos como primer parámetro de la funcion externa _errno_location
	CALL	[rel __errno_location wrt ..got]	;Esta funcion nos devuelve en RAX la direccion de memoria donde está la variable errno.
;Referring to an external or global symbol using wrt ..got causes the linker to build an entry in the GOT containing the address of the symbol, 
;and the reference gives the distance from the beginning of the GOT to the entry; so you can add on the address of the GOT, load from the resulting 
;address, and end up with the address of the symbol. 
;Traduccion
;	hay que indicar que el tipo de direcciones es relativo y especificar wrt got para que el ensamblador ponga la dirección del simbolo externo
;	en la tabla de simbolos para que cuando calcule la @ de memoria, la obtenga bien.
;http://www.posix.nl/linuxassembly/nasmdochtml/nasmdoc6.html#section-6.5.2 
	MOV		[rax], rdi			;Movemos el valor de rdi a errno (variable de memoria); vigila que errno es de 16 bits
	MOV		rax, -1				;Movemos -1 a rax (lo que devolveremos al user)

; Post-subrutina.
return:

RET