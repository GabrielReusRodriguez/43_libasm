;void	ft_list_push_front(t_list **lst, t_list *new);
default rel

section .text
global ft_list_push_front
;Recuerda, 
;	RDI 1r arg
;	RSI 2o arg
;	RDX 3r arg
;	RCX 4o arg
;	RAX retorno.

; Punteros son de 64 bits => 8 bytes


; Pre-subrutine
ft_list_push_front:
; Subrutine
	; Si la lista está vacía, solo tengo que asignar el valor new a *lst.
	CMP  QWORD [rdi], 0
	JE  update_lst
	;Si no está vacía, me guardo el valor del inicio de la lista y lo pongo como next de new.
	MOV rcx, [rdi]
	MOV [rsi + 8], rcx  ; los punteros son de 64 bits ( 8 bytes ) asi que el puntero next es la direccion de la estructura + los 64 bits del puntero content.
update_lst:
	; Ahora asigno  el valor de new como *lst
	MOV QWORD [rdi], rsi
; Post-subrutine
return:
	RET