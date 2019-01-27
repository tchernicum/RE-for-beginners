str_trim:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], rdi
; здесь начинается первая часть for()
	mov	rax, QWORD PTR [rbp-24]
	mov	rdi, rax
	call	strlen
	mov	QWORD PTR [rbp-8], rax   ; str\_len
; здесь заканчивается первая часть for()
	jmp	.L2
; здесь начинается тело for()
.L5:
	cmp	BYTE PTR [rbp-9], 13     ; \verb|c=='\r'?|
	je	.L3
	cmp	BYTE PTR [rbp-9], 10     ; \verb|c=='\n'?|
	jne	.L4
.L3:
	mov	rax, QWORD PTR [rbp-8]   ; str\_len
	lea	rdx, [rax-1]             ; EDX=str\_len-1
	mov	rax, QWORD PTR [rbp-24]  ; s
	add	rax, rdx                 ; RAX=s+str\_len-1
	mov	BYTE PTR [rax], 0        ; s[str\_len-1]=0
; тело for() заканчивается здесь
; здесь начинается третья часть for()
	sub	QWORD PTR [rbp-8], 1     ; str\_len--
; здесь заканчивается третья часть for()
.L2:
; здесь начинается вторая часть for()
	cmp	QWORD PTR [rbp-8], 0     ; str\_len==0?
	je	.L4                      ; тогда на выход
; проверить второе условие, и загрузить "c"
	mov	rax, QWORD PTR [rbp-8]   ; RAX=str\_len
	lea	rdx, [rax-1]             ; RDX=str\_len-1
	mov	rax, QWORD PTR [rbp-24]  ; RAX=s
	add	rax, rdx                 ; RAX=s+str\_len-1
	movzx	eax, BYTE PTR [rax]      ; AL=s[str\_len-1]
	mov	BYTE PTR [rbp-9], al     ; записать загруженный символ в "c"
	cmp	BYTE PTR [rbp-9], 0      ; это ноль?
	jne	.L5                      ; да? тогда на выход
; здесь заканчивается вторая часть for()
.L4:
; возврат "s"
	mov	rax, QWORD PTR [rbp-24]  
	leave
	ret
