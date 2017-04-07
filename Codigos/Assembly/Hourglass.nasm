; Hourglass.nasm

; Desenha uma ampulheta (dois triangulo invertidos um em cima do outro) na tela.
leaw $31,%A
movw %A,%D
leaw $SCREEN ,%A
movw %D,(%A) ; desenha primeira linha

leaw $10,%A
movw %A,%D
leaw $16416 ,%A
movw %D,(%A)

leaw $4,%A
movw %A,%D
leaw $16448 ,%A
movw %D,(%A)

leaw $10,%A
movw %A,%D
leaw $16480 ,%A
movw %D,(%A)

leaw $31,%A
movw %A,%D
leaw $16512 ,%A
movw %D,(%A)