$SG2997	DB	'%d', 0aH, 00H

main	PROC
	sub	rsp, 40
	mov	edx, 2
	lea	r8d, QWORD PTR [rdx+1] ; R8D=3
	lea	ecx, QWORD PTR [rdx-1] ; ECX=1
	call	f
	lea	rcx, OFFSET FLAT:$SG2997 ; '\%d'
	mov	edx, eax
	call	printf
	xor	eax, eax
	add	rsp, 40
	ret	0
main	ENDP

f	PROC
	; ECX - 1番目の引数
	; EDX - 2番目の引数
	; R8D - 3番目の引数
	imul	ecx, edx
	lea	eax, DWORD PTR [r8+rcx]
	ret	0
f	ENDP
