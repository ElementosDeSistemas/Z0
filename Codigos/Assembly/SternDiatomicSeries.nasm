; SternDiatomicSeries.nasm

; Calcula a série Stern’s Diatomic, a quantidade de elementos gerados é RAM[0]*2+1
; Os resultados são armazenados na RAM[1], RAM[2], etc....
; A série deve gerar: 1,1,2,1,3,2,3,1,4,3,5,2,5,3,4,1,5,4,7,3,8,5,7,2,7,5, etc...


leaw $0,%A ; A = 0
movw (%A), %D ; RAM[0] = D
decw %D ; D-=1
decw %D; D-=1
leaw $PASSA, %A ; A = PASSA
jle ; Salta Execução se Menor Igual a Zero

leaw $0,%A  ; A = 0
movw (%A), %D ; RAM[0] = D
addw %D, (%A), (%A) ; RAM[A] = RAM[A] + D
incw (%A) ;


;Criando Lista inicial
leaw $1,%A ; A = 1
incw (%A) ; A += 1
leaw $2,%A ;A = 2
incw (%A) = ;A+=1
leaw $3,%A ; A = 3
incw (%A) ;A += 1
incw (%A) ;A += 1

leaw $4, %A; A = 4
movw %A, %D; D = a
leaw $7000, %A ; A = 7000




LOOP:

leaw $7000,%A ; A = 7000
movw (%A),%D ; RAM[A] = D
leaw %7001,%A ; A = 7001
movw %D,(%A); RAM[A] = D

; VERIFICA SE É PAR
volta:
leaw $2, %A 		; A = 2
movw %A, %D 		;  D = A
leaw $7001, %A 		; A = 7001
subw (%A), %D, (%A) ; RAM[A] = RAM[A] - D
movw (%A),%D 		; D = RAM[A]
leaw $volta, %A 	; A = volta
jg ; Salta Execução se Maior que Zero
leaw %IMPAR,%A ; A = IMPAR
jl ; – Salta Execução se Menor que Zero

; FUNÇÃO VALORES PARES
leaw $7000, %A ; A = 7000
movw (%A), %D ; D = RAM[A]
leaw $7001,%A ;A = 7001
movw %D, (%A); RAM[A] = D
leaw $0, %A; A = 0
movw %A,%D; D = A
leaw $7002,%A ; A = 7000
movw %D,(%A) ; RAM[A] = D


; LOOP divisaoNDO POR 2
divisao:
leaw $2, %A ; A = 2
movw %A, %D ; D = A
leaw $7001, %A ; A = 7001
subw (%A), %D, (%A); RAM[A] = RAM[A] - D
movw (%A), %D; D = RAM[A]
leaw $7002, %A; A = 7002
incw (%A) ; A += 1
leaw $divisao, %A; A = divisao
jg ;Salta Execução se Maior que Zero

leaw $7002, %A ; A = 7002
movw (%A),%D ; D = RAM[A]
movw (%A),%A; A = RAM[A]
movw (%A),%D ; D = RAM[A]
leaw $7000,%A; A = 7000
movw (%A),%A; A = RAM[A]
movw %D,(%A); RAM[A] = D

leaw $PASSA, %A; A = PASSA
jmp    ; JUMP INCONDICIONAL

IMPAR:   ;


leaw $7000, %A ; A = 7000
movw (%A), %D; D = RAM[A]
decw %D; D -= 1
leaw $7001,%A   ;i-1
movw %D, (%A) ; RAM[A] = D
leaw $0, %A; A = 0
movw %A,%D; D = A
leaw $7002,%A; A = 7002
movw %D,(%A) ; RAM[A] =D
leaw $7003,%A; A = 7003
movw %D,(%A) ; RAM[A] = D

div_impar2:
leaw $2, %A ; A = 2
movw %A, %D; D = A
leaw $7001, %A; A = 7001
subw (%A), %D, (%A); RAM[A] = RAM[A] - D
movw (%A), %D ; D = RAM[A]
leaw $7002, %A; A = 7002
incw (%A) ;A += 1
leaw $div_impar2, %A; A =div_impar2
jg; Salta Execução se Maior que Zero

leaw $7002, %A ; A = 7002
movw (%A),%D ; D = RAM[A]
movw %D, %A ; A = D
movw (%A),%D; D = RAM[A]
leaw $7002, %A ; A = 7002
movw %D, (%A); RAM[A] = D

;vai fazer o A[(i+1)/2] e colocar no A[7003]
leaw $7000, %A; A = 7000
movw (%A), %D; D = RAM[A]
incw %D; D+=1
leaw $7001,%A ; A = 7001
movw %D, (%A); RAM[A] = D


div_impar:
leaw $2, %A ; A = 2
movw %A, %D ; D = A
leaw $7001, %A ; A = 7001
subw (%A), %D, (%A); RAM[A] = RAM[A] - D
movw (%A), %D; D = RAM[A]
leaw $7003, %A; A = 7003
incw (%A); A += 1
leaw $div_impar, %A; A = div_impar
jg ;Salta Execução se Maior que Zero

leaw $7003, %A ; A = 7003
movw (%A),%D; D = RAM[A]
movw %D, %A; A = D
movw (%A),%D; D = RAM[A]
leaw $7003, %A ; A = 7003
movw %D, (%A) ; RAM[A] = D

leaw $7003, %A; A = 7003
movw (%A),%D; D = RAM[A]
leaw $7002, %A; A = 7002
addw (%A),%D,(%A) ; RAM[A] = D + RAM[A]


movw (%A),%D; D = RAM[A]
leaw $7000,%A; A = 7000
movw (%A),%A; A = RAM[A]
movw %D,(%A); RAM[A] = D

PASSA:
leaw $7000, %A; A = 7000
incw (%A); contador +=1

movw (%A), %D  ; D = RAM[A]
leaw $0, %A; A = 0
subw (%A),%D,%D ;D = RAM[A] - D
leaw $LOOP,%A; A = LOOP
jge; Salta Execução se Maior Igual a Zero

END:
leaw $END, %A ; A = END
jmp; JUMP INCONDICIONAL
