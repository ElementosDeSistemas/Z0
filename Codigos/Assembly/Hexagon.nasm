; Hexagon.nasm

; Desenha um hexagon na tela.
leaw $2016, %A
movw %A, %D 
leaw $7, %A 
movw %D, (%A)
leaw $4080, %A
movw %A, %D 
leaw $6, %A 
movw %D, (%A)
leaw $8184, %A
movw %A, %D 
leaw $5, %A 
movw %D, (%A)
leaw $8184, %A
movw %A, %D 
leaw $4, %A 
movw %D, (%A)
leaw $4080, %A
movw %A, %D 
leaw $3, %A 
movw %D, (%A)
leaw $2016, %A
movw %A, %D 
leaw $2, %A 
movw %D, (%A)
leaw $960, %A
movw %A, %D 
leaw $1, %A 
movw %D, (%A)


leaw $960, %A
movw %A, %D
leaw $SCREEN, %A
movw %D, (%A)
movw %A, %D

Loop:

leaw $32, %A
addw %A, %D, %D
leaw $0, %A
movw %D, (%A)

;preciso fazer esse valor decrescer
leaw $R7, %A

movw %A, %D
leaw $0, %A
movw (%A), %A 
movw %D, (%A) 
movw %A, %D
leaw $Loop,%A
jmp
