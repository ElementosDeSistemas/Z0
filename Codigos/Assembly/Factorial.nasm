; Factorial.nasm

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)
dec %D
dec %D
leaw $2, %A
movw %D, (%A)


TREAT:

leaw $1, %A
movw (%A), %D
leaw $CAZEO, %A
je
nop

leaw $1, %A
movw (%A), %D
dec %D
leaw $ESCAPE, %A
je
nop


LOOPAO:
;carregar R2 em D
;conferir se ele é não zero
leaw $2, %A
movw (%A), %D
;escapar se R2 for zero
leaw $ESCAPE, %A
je
nop


leaw $2, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

;jogar R1 em R4
leaw $1, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)

leaw $2, %A
dec (%A)
;--fim de LOOPAO

LOOPIN:

leaw $3, %A
movw (%A), %D
leaw $LOOPAO, %A
je
nop


leaw $4, %A
movw (%A), %D
leaw $1, %A
add %D, (%A), (%A)

leaw $3, %A
dec (%A)
leaw $LOOPIN, %A
jmp
nop

CAZEO:
leaw $1, %A
inc (%A)
leaw $TREAT, %A
jmp
nop

ESCAPE:
nop