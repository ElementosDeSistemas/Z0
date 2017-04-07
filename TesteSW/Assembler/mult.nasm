leaw $2, %A
movw (%A), %D
leaw $0, %A
addw (%A), %D, %D
leaw $2, %A
movw %D, (%A)
leaw $1, %A
subw (%A), $1, (%A)
leaw $1, %A
movw (%A), %D
leaw $0, %A
jg
nop
