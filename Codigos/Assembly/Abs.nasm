; Abs.nasm

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw R1, %A
movw (%A), %D
neg %D
leaw $0, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)
jle
nop