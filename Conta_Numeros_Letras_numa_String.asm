.text
.globl main

main:
     move $t0, $zero     # i = 0 ($s0 é i)
     li $s3,17  # n - tam do vetor
     la  $s1,msg1
     li $s6,0  #Conta maiusculas
     li $s7,0  #Conta minusculas
     li $s5,0  #Conta numeros
     
     LOOP:      
      bgt $t0, $s3, EXIT   # se $s0 >= $s3 ( i == n) vá para EXIT    (tbm pode ser a condiçao de parada o caracter lido ser == null)
  
      # percorrendo a STRING[i]     
       add $t2, $s1, $t0    # t2 = ( base + deslocameneto )      
       lb $t3, 0($t2)       # $t3 = vetor[i]
       
       li $t4,48 #intervalo inicial de numeros na tabela ASCII
       li $t5,57 #intervalo final de numeros na tabela ASCII
       numeros:
       		ble $t3,$t5,checagemN
       
       li $t4,65 #intervalo inicial de letras maisculas na tabela ASCII
       li $t5,90 #intervalo final de letras maisculas na tabela ASCII
       maiusculas:		
       		ble $t3,$t5,checagemMai
       
       li $t4,97 #intervalo inicial de letras minusculas na tabela ASCII
       li $t5,122 #intervalo final de letras minusculas na tabela ASCII
       minusculas:
       		ble $t3,$t5,checagemMin
       		j IPUM

       checagemN: 
       		ble $t3,$t4,conta_Numeros
       		j IPUM
        
        checagemMai: 
       		bge $t3,$t4,conta_maiuscula
       		j IPUM
        
        checagemMin: 
       		bge $t3,$t4,conta_minuscula
       		j IPUM
       #----------------------Contadores----------------------
       conta_Numeros:
       		addi $s5,$s5,1
       		j IPUM
       	
       	conta_maiuscula:
       		addi $s6,$s6,1
       		j IPUM
       	
       	conta_minuscula:
       		addi $s7,$s7,1
       		j IPUM

      # configurações do FOR      
      IPUM: add $t0,$t0,1       # $s0 = $s0 + 1 (ou i = i + 1) é o contador      
      j LOOP                 # volta para o LOOP  
      


 EXIT: 
 # imprimindo a string  
    li $v0, 4  
    la $a0, $LN   
    syscall 

   # imprimindo o inteiro   
     li $v0, 1   
     move $a0, $s5   
     syscall 
 
 # imprimindo a string  
    li $v0, 4  
    la $a0, $LM   
    syscall 

   # imprimindo o inteiro   
     li $v0, 1   
     move $a0, $s6   
     syscall 
 
  # imprimindo a string  
    li $v0, 4  
    la $a0, $LMM   
    syscall 

   # imprimindo o inteiro   
     li $v0, 1   
     move $a0, $s7   
     syscall
             
          
 # verificar se vetor[i] > vetor[j]   
.data 
$LN: .asciiz "Quantidade de Numeros: "
$LM: .asciiz "\nQuantidade de Letras Maisculas: "
$LMM: .asciiz "\nQuantidade de Letras Minusculas: "
msg1: .asciiz "HeLLo WoRLd 1253"
