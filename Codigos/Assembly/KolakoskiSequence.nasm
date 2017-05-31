; KolakoskiSequence.nasm

; Le a quantidade de valores da RAM[0] e grava a sequencia de números 
; da Sequencia de Kolakoski nas posições seguintes RAM[1], RAM[2], etc....
; Por exemplo: se RAM[0]=6
; RAM[1]=1, RAM[2]=2, RAM[3]=1, RAM[4]=1, RAM[5]=2, RAM[6]=1
; Maiores informações em: https://oeis.org/A000002

leaw $1, %A
 movw $1,(%A)
 
 leaw $2, %A
 movw $1,(%A)
 incw (%A)
 
 leaw $3, %A
 movw $1,(%A)
 incw (%A)
 leaw $100,%A
 movw $1,(%A)
 incw (%A)
 incw (%A)
 
 leaw $101,%A
 movw $1,(%A)
 incw (%A)
 
 leaw $102,%A
 movw $1, (%A)
 incw (%A)
 incw (%A)
 incw (%A)
 
 
 LOOP:
 leaw $101,%A
 subw (%A),$1,%D
 leaw $PASSA2,%A
 je
 leaw $101,%A
 decw (%A)
 leaw $PASSA3
 jmp
 PASSA2:
 leaw $101,%A
 incw (%A)
 PASSA3:
 leaw $101,%A     
 movw (%A),%D    
 leaw $102,%A    
 movw (%A),%A   
 movw %D,(%A)   
 leaw $100,%A
 movw (%A),%A
 subw (%A),$1,%D
 decw %D
 leaw $PASSA,%A
 jne
 leaw $102,%A
 incw (%A)  
 leaw $101,%A    
 movw (%A),%D    
 leaw $102,%A    
 movw (%A),%A    
 movw %D,(%A)   
 PASSA:
 leaw $100,%A
 incw (%A) 
 leaw $102,%A
 incw (%A) 
 leaw $100,%A    
 movw (%A),%D    
 leaw $0,%A     
 movw (%A),%A    
 subw %D,%A,%D   
 leaw $LOOP,%A
 jl

