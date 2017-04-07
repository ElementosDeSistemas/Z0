; SternDiatomicSeries.nasm

; Calcula a série Stern’s Diatomic, a quantidade de elementos gerados é RAM[0]*2+1
; Os resultados são armazenados na RAM[1], RAM[2], etc....
; A série deve gerar: 1,1,2,1,3,2,3,1,4,3,5,2,5,3,4,1,5,4,7,3,8,5,7,2,7,5, etc...


leaw $0, %A ; A = 0
movw $1, (%A) ; RAM[0] = 1
leaw $1, (%A) ; A = 1
movw $1, (%A) ; RAM[1] = 1
LOOP:
leaw $0, %A; A = 0
movw (%A), %A ; RAM[0] = A
movw %A , %D ; D = A
leaw $0,%A ; A = 0
addw %D , $1, (%A); RAM[0]+=1
movw (%A), %D ; RAM[0] = D
movw %D, %A ; D = A
leaw $LOOP, %A
jne
nop
