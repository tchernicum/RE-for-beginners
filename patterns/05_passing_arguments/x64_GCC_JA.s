f:
	; EDI - 1番目の引数
	; ESI - 2番目の引数
	; EDX - 3番目の引数
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR [rbp-4], edi
	mov	DWORD PTR [rbp-8], esi
	mov	DWORD PTR [rbp-12], edx
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-8]
	add	eax, DWORD PTR [rbp-12]
	leave
	ret
main:
	push	rbp
	mov	rbp, rsp
	mov	edx, 3
	mov	esi, 2
	mov	edi, 1
	call	f
	mov	edx, eax
	mov	eax, OFFSET FLAT:.LC0 ; "\%d\textbackslash{}n"
	mov	esi, edx
	mov	rdi, rax
	mov	eax, 0  ; 渡されたベクトルレジスタの数
	call	printf
	mov	eax, 0
	leave
	ret
