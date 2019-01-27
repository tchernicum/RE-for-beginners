str_trim:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], rdi
; for() first part begins here
	mov	rax, QWORD PTR [rbp-24]
	mov	rdi, rax
	call	strlen
	mov	QWORD PTR [rbp-8], rax   ; str\_len
; for() first part ends here
	jmp	.L2
; for() body begins here
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
; for() body ends here
; for() third part begins here
	sub	QWORD PTR [rbp-8], 1     ; str\_len--
; for() third part ends here
.L2:
; for() second part begins here
	cmp	QWORD PTR [rbp-8], 0     ; str\_len==0?
	je	.L4                      ; exit then
; check second clause, and load "c"
	mov	rax, QWORD PTR [rbp-8]   ; RAX=str\_len
	lea	rdx, [rax-1]             ; RDX=str\_len-1
	mov	rax, QWORD PTR [rbp-24]  ; RAX=s
	add	rax, rdx                 ; RAX=s+str\_len-1
	movzx	eax, BYTE PTR [rax]      ; AL=s[str\_len-1]
	mov	BYTE PTR [rbp-9], al     ; store loaded char into "c"
	cmp	BYTE PTR [rbp-9], 0      ; is it zero?
	jne	.L5                      ; yes? exit then
; for() second part ends here
.L4:
; return "s"
	mov	rax, QWORD PTR [rbp-24]  
	leave
	ret
