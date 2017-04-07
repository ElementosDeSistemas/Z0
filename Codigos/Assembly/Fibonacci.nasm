; Fibonacci.nasm

; Le a quantidade de valores da RAM[0] e grava a sequencia de números 
; de Fibonacci nas posições seguintes RAM[1], RAM[2], etc....
; Por exemplo: se RAM[0]=6
; RAM[1]=0, RAM[2]=1, RAM[3]=1, RAM[4]=2, RAM[5]=3, RAM[6]=5
; Maiores informações em: https://oeis.org/A000045

leaw $0,%A
movw (%A),%D 
leaw $FINAL, %A
je 
decw %D
leaw $1,%A
movw $0, (%A)
leaw $FINAL, %A
je 
decw %D
leaw $2,%A
movw $1,(%A)
leaw $FINAL, %A
je 
LOOP:
decw %D
leaw $16348, %A
movw %D, (%A)
leaw $0,%A
subw (%A),%D,%A
decw %A
movw (%A),%D
incw %A
movw %D, (%A)
decw %A
decw %A
movw (%A),%D
incw %A
incw %A
addw (%A),%D,(%A)
leaw $16348, %A
movw (%A), %D
leaw $LOOP, %A
jne 
FINAL: