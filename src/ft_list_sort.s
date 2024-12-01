; Firma
; void ft_list_sort(t_list **begin_list, int (*cmp)());

; Ejemplo....
;void	ft_list_sort(t_list **begin_list, int (*cmp)())
;{
;	t_list	*ptr;
;	t_list	*ptr2;
;	t_list	*next;
;
;	ptr = *begin_list;
;	while (ptr)
;	{
;		ptr2 = *begin_list;
;		while (ptr2->next)
;		{
;			if ((*cmp)(ptr2->data, ptr2->next->data) > 0)
;			{
;				next = ptr2->data;
;				ptr2->data = ptr2->next->data;
;				ptr2->next->data = next;
;			}
;			ptr2 = ptr2->next;
;		}
;		ptr = ptr->next;
;	}
;}
;NOTA: 
;	strcmp por ejemplo devuelve 1 si str1 > str2
;	strcmp por ejemplo devuelve 0 si str1 == str2
;	strcmp por ejemplo devuelve -1 si str1 < str2
default rel


section .text
;Recuerda, 
;	RDI 1r arg  =>  t_list **begin_list
;	RSI 2o arg  =>  int (*cmp)()
;	RDX 3r arg
;	RCX 4o arg
;	RAX retorno.
global  ft_list_sort

swap:

	MOV	r10, r9		; @ de node
	MOV	r11, [r9 + 8]	; @ de node->next

	MOV	rcx, [r10]		; @ de node->content
	MOV rax, [r11]		; @ de node->next->content

	MOV	[r11], rcx
	MOV	[r10], rax

	JMP	next_ptr2

ft_list_sort:
; Pre-subrutina
	MOV	rdx, [rdi] 
	MOV r8, [rdi]
; Subrutina
	; Hago una iteracion por nodo, en cada iteracion obtenemos el más grande al final.
loop:
	CMP	r8, 0
	JE	return
	MOV	r9, rdx ; Obtengo la primer aposicion para ptr2.
loop_list:
	; Recorremos el bucle hasta el final 
	CMP	QWORD [r9 + 8], 0
	JE	next_ptr
	; Hacemos la comparacion del nodo actual con el siguiente.
	; Como somos callers, guardamos los registros rdi, rsi en la pila
	PUSH	rsi
	PUSH	rdi
	PUSH	rcx
	PUSH	r8
	PUSH	r9
	MOV		rcx, rsi
	MOV		rdi, [r9]

	MOV		rsi, [r9 + 8] 	; Aqui obtengo la dirección de memoria del siguiente nodo (el *next)
	MOV		rsi, [rsi]		; Aqui obtengo la dirección de memoria del content. (el node->content)

	CALL	rcx
	POP		r9
	POP		r8
	POP		rcx
	POP		rdi
	POP		rsi
	; Fin de la llamada
	
;	CMP		al, 0	; Para comparar con signo, hemos de pillar los 8 primeros bytes, si lo pilla todo como numero, considera que es > 0
;	JG	swap
					; Tb podemos hacer la comparacion de si es positivo con un test y mirando los flags jz y js.
	TEST	eax, eax
	JZ		next_ptr2
	JS		next_ptr2
	JMP		swap
next_ptr2:
	MOV	r9, [r9 + 8] ; ptr2 = ptr2->next;
	JMP	loop_list
next_ptr:
	; Actualizamos el puntero de esa posicion.
	MOV	r8, [r8 + 8] ; Equivale a node = node->next
	JMP	loop

; Post-subrutina
return:
    RET