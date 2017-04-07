; RightTriangle.nasm

; Desenha um triângulo retângulo na tela.

movw $1, %D
leaw $0,%A
movw %D,(%A)
leaw %SCREEN,%A
movw %A,%D
leaw $1,%A
movw %D,(%A)

loop:
leaw $0,%A
movw (%A),%D
leaw $1,%A
movw (%A),%A
movw %D,(%A)
addw %D,(%A),%D
incw %D
leaw $0,%A
movw %D,(%A)
leaw $32,%A
movw %A,%D
leaw $1,%A
addw %D,(%A),(%A)
movw (%A),%D
leaw $16864,%A
subw %A,%D,%D
leaw %loop,%A
jge
nop



