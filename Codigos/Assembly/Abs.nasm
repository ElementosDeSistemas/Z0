; Abs.nasm

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw $11,%A
jmp
nop
leaw $0,%A ; começo do modulo
subw %A,%D, %A
movw %A,%D
leaw $0,%A
movw %D,(%A) ;final do modulo
leaw $100,%A
jmp
nop
leaw $1,%A; jump inicial para essa linha -1
movw (%A),%D
leaw $2,%A
jl
nop