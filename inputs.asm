.text
.globl main

main:	
	# Lendo o inteiro   
         li $v0, 5     
         syscall
         move $a0, $v0   #v0 contem ovalor lido
	# imprimindo o inteiro   
         li $v0, 1      
         syscall 
     	
     	# Lendo uma string
     	 la $t1,$input   
         li $v0, 8
         move $a0,$t1
         li $a1,20     
         syscall
	
	# Lendo uma string
     	 la $t1,$input   
         li $v0, 8
         move $a0,$t1
         li $a1,20     
         syscall
	
	# imprimindo a string   
         li $v0, 4   
         move $a0,$t1  
         syscall
.data 
$input: .asciiz " "
 	