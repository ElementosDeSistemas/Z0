leaw $1,%A
movw (%A),%D
leaw $2,%A
movw (%A),%A
subw %A,%D,%D
leaw %done,%A
jge
nop
leaw $2,%A
movw (%A),%D
leaw $3,%A
movw %D,(%A)

loop:
leaw $2,%A
movw (%A),%D
leaw $3,%A
movw (%A),%A
addw %D,%A,%D
leaw $2,%A
movw %D,(%A)
leaw $1,%A
movw (%A),%D
leaw $2,%A
movw (%A),%A
subw %D,%A,%D
leaw %loop,%A
jge
nop

leaw $3,%A
movw (%A),%D
leaw $2,%A
movw (%A),%A
subw %A,%D,%D
leaw $1,%A
movw (%A),%A
subw %A,%D,%D
leaw %finish,%A
jmp
nop

done:
leaw $1,%A
movw (%A),%D

finish:
leaw $0,%A
movw %D,(%A)
