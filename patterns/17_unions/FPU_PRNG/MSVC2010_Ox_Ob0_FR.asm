$SG4238	DB	'%f', 0aH, 00H

__real@3ff0000000000000 DQ 03ff0000000000000r	; 1

tv130 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=valeur pseudo-aléatoire
	and	eax, 8388607		; 007fffffH
	or	eax, 1065353216		; 3f800000H
; EAX=valeur pseudo-aléatoire \& 0x007fffff | 0x3f800000
; la stocker dans la pile locale:
	mov	DWORD PTR _tmp$[esp+4], eax
; la recharger en tant que nombre à virgule flottante:
	fld	DWORD PTR _tmp$[esp+4]
; soustraire 1.0:
	fsub	QWORD PTR __real@3ff0000000000000
; stocker la valeur obtenue dans la pile locale et la recharger:
	fstp	DWORD PTR tv130[esp+4] ; \verb|\  ces instructions sont redondantes|
	fld	DWORD PTR tv130[esp+4] ; \verb|/                                   |
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP

_main	PROC
	push	esi
	xor	eax, eax
	call	_time
	push	eax
	call	?my_srand@@YAXI@Z
	add	esp, 4
	mov	esi, 100
$LL3@main:
	call	?float_rand@@YAMXZ
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET $SG4238
	call	_printf
	add	esp, 12
	dec	esi
	jne	SHORT $LL3@main
	xor	eax, eax
	pop	esi
	ret	0
_main	ENDP
