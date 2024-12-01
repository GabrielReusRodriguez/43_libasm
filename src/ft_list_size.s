default rel

;int    ft_lstsize(t_list *lst)
global  ft_list_size
;Recuerda, 
;	RDI 1r arg
;	RSI 2o arg
;	RDX 3r arg
;	RCX 4o arg
;	RAX retorno.
section .text

ft_list_size:

; Pre-subrutina
    XOR rax, rax ; Otra forma de asignar valor 0 a un registro. La ventaja es que pilla todos los bits.
    mov r8, rdi
; Subrutina
loop:
    CMP r8, 0
    JE  return
    INC rax
    mov r8, [r8 + 8] ; esto equivale a node = node->next, el primer puntero es content por lo que si le sumas 8 bytes que ocupa el puntero tenemos next.
    JMP loop
; Post-subrutina
return:
    RET