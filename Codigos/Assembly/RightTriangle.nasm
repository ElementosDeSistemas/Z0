; RightTriangle.nasm

; Desenha um tri�ngulo ret�ngulo na tela.


leaw $SCREEN,%A
movw $1,(%A) 

leaw $3, %A
movw %A, %D
leaw $16416,%A
movw %D,(%A)

leaw $7, %A
movw %A, %D
leaw $16448,%A
movw %D,(%A)

