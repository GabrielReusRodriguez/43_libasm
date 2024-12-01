;Firma void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)())
;void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)())
;{
;	t_list		*current;
;	t_list		*previous;
;
;	previous = 0;
;	current = *begin_list;
;	while (current)
;	{
;		if ((cmp)(current->data, data_ref) == 0)
;		{
;			if (previous == 0)
;			{
;				*begin_list = current->next;
;				free(current);
;				current = *begin_list;
;			}
;			else
;			{
;				previous->next = current->next;
;				free(current);
;				current = previous->next;
;			}
;		}
;		else
;		{
;			previous = current;
;			current = current->next;
;		}
;	}
;}

default	rel

extern free
section	.text

global	ft_list_remove_if
;Recuerda, 
;	RDI 1r arg  =>  t_list **begin_list
;	RSI 2o arg  =>  void * data_ref
;	RDX 3r arg	=>	int (*cmp)()
;	RCX 4o arg
;	RAX retorno.

; Pre-subrutine

remove_not_first_node:
	PUSH	rax
	MOV		rax, [r8 + 8]
	MOV		[rcx + 8], rax
	POP		rax
	PUSH	rdi
	PUSH	rsi
	PUSH	rcx
	PUSH	r8
	PUSH	r9
	PUSH	r10
	MOV		rdi, r8
	CALL	[rel free wrt ..got]
	POP		r10
	POP		r9
	POP		R8
	POP		rcx
	POP		rsi
	POP		rdi
	MOV		r8, [rcx + 8]
	JMP	loop

remove_first_node:
	PUSH	rax
	MOV		rax, [r8 + 8]	; Esto es current->next
	MOV		[rdi], rax
	POP		rax
	PUSH	rdi				; Hacemos free del current.	
	PUSH	rsi
	PUSH	rcx
	PUSH	r8
	PUSH	r9
	PUSH	r10
	MOV		rdi, r8
	CALL	[rel free wrt ..got]
	POP		r10
	POP		r9
	POP		R8
	POP		rcx
	POP		rsi
	POP		rdi
	MOV		r8,	[rdi]	; Actualizamos el current. current = *begin_list
	JMP		loop

ft_list_remove_if:
; Subrutine
	MOV	r8, [rdi]	; Salvamos el inicio de la lista. (será nuestro current node)
	MOV	r9, rsi		; Salvamos la @ de la data_ref
	MOV	r10, rdx	; Guardamos la @ de la funcion de comparacion.
	MOV	rcx, 0		; rcx será el registro donde guardaremos el nodo anterior. previous

; Post-Subrutine
loop:
	CMP		r8, 0
	JE		return
	; Llamamos a la funcion de comparacion 
	PUSH	rdi
	PUSH	rsi
	PUSH	rcx
	PUSH	rdx
	PUSH	r8
	PUSH	r9
	PUSH	r10
	MOV		rdi, [r8]		; El primer parametro es current->content
	MOV		rsi, r9			; El segundo parametro es el data_ref
	CALL	r10
	POP		r10
	POP		r9
	POP		R8
	POP		rdx
	POP		rcx
	POP		rsi
	POP		rdi
	; Comparamos el valor devuelto en RAX con 0 (Recuerda que puede ser negativo)
	TEST	rax, rax
	JNZ		next_node
	; Aqui hacemos el "borrado"
	CMP		rcx, 0	;Revisamos si estamos en el primer nodo de la lista (previous == NULL)
	JE		remove_first_node
	JMP		remove_not_first_node
next_node:
	MOV	rcx, r8
	MOV	r8, [r8 + 8] ; Recuerda, cada punero son 8 bytes por lo que node->next es @node + 8 bytes.
	JMP	loop
return:
	RET