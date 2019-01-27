; désigner ip1 comme "dd", ip2 comme "cc", ip3 comme "bb", ip4 comme "aa".
_ip1$ = 8	; taille = 1
_ip2$ = 12	; taille = 1
_ip3$ = 16	; taille = 1
_ip4$ = 20	; taille = 1
_form_IP PROC
	movzx	eax, BYTE PTR _ip1$[esp-4]
	; EAX=000000dd
	movzx	ecx, BYTE PTR _ip2$[esp-4]
	; ECX=000000cc
	shl	eax, 8
	; EAX=0000dd00
	or	eax, ecx
	; EAX=0000ddcc
	movzx	ecx, BYTE PTR _ip3$[esp-4]
	; ECX=000000bb
	shl	eax, 8
	; EAX=00ddcc00
	or	eax, ecx
	; EAX=00ddccbb
	movzx	ecx, BYTE PTR _ip4$[esp-4]
	; ECX=000000aa
	shl	eax, 8
	; EAX=ddccbb00
	or	eax, ecx
	; EAX=ddccbbaa
	ret	0
_form_IP ENDP
