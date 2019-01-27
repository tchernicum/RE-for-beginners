my_srand PROC
        LDR      r1,|L0.52|  ; charger un pointeur sur rand\_state
        STR      r0,[r1,#0]  ; sauver rand\_state
        BX       lr
        ENDP

my_rand PROC
        LDR      r0,|L0.52|  ; charger un pointeur sur rand\_state
        LDR      r2,|L0.56|  ; charger RNG\_a
        LDR      r1,[r0,#0]  ; charger rand\_state
        MUL      r1,r2,r1
        LDR      r2,|L0.60|  ; charger RNG\_c
        ADD      r1,r1,r2
        STR      r1,[r0,#0]  ; sauver rand\_state
; AND avec 0x7FFF:
        LSL      r0,r1,#17
        LSR      r0,r0,#17
        BX       lr
        ENDP

|L0.52|
        DCD      ||.data||
|L0.56|
        DCD      0x0019660d
|L0.60|
        DCD      0x3c6ef35f

        AREA ||.data||, DATA, ALIGN=2

rand_state
        DCD      0x00000000
