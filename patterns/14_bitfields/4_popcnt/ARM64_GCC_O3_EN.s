f:
	mov	w2, 0		; rt=0
	mov	x5, 1
	mov	w1, w2
.L2:
	lsl	x4, x5, x1	; w4 = w5<<w1 = 1<<i
	add	w3, w2, 1	; new\_rt=rt+1
	tst	x4, x0		; (1<<i) \& a
	add	w1, w1, 1	; i++
; result of TST was non-zero?
; then w2=w3 or rt=new\_rt. 
; otherwise: w2=w2 or rt=rt (idle operation)
	csel	w2, w3, w2, ne
	cmp	w1, 64		; i<64?
	bne	.L2		; yes
	mov	w0, w2		; return rt
	ret
