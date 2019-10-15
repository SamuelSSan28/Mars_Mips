.text
.globl main

main:
     la $s4, Vetor #le endereco base vetor_A
     move $s0, $zero     # i = 0 ($s0 é i) 
     move $s1, $zero     # j = 0 ($s1 é j)  
     li $s3,5
     LOOP:      
      # configurações do FOR      
      beq $s0, $s3, IMPRIME   # se ( i >= n) vá para IMPRIME  
      addi $s1,$s0,1 #j
        LOOP2:      
          # configurações do FOR   
          beq  $s1, $s3, IPUM   # se ( j == n) vá para IPUM       
  	    # percorrendo o ARRAY[i]     -> t3
            sll $t1, $s0, 2      # $t1 = 4 * i   é o deslocamento
            add $t2, $s4, $t1    # t2 = ( base + deslocameneto )      
            lw $t3, 0($t2)       # $t3 = vetor[i]
            
            # percorrendo o ARRAY[j]     -> t7
            sll $t5, $s1, 2        
            add $t6, $s4, $t5          
            lw $t7, 0($t6) 
            
            ble $t7,$t3,Troca #Se ARRAY[i] <= ARRAY[j] troca
                
           JPUM: 
           addi $s1, $s1, 1       # $s0 = $s0 + 1 (ou i = i + 1) é o contador++
           j LOOP2                 # volta para o LOOP2    
      IPUM:
        addi $s0, $s0, 1       # $s0 = $s0 + 1 (ou i = i + 1) é o contador      
      	j LOOP                 # volta para o LOOP  
         
      
Troca:
      sw $t7,0($t2) # ARRAY[i] = ARRAY[j](t7)
      sw $t3,0($t6) # ARRAY[j] = ARRAY[i](t3)
      j JPUM

IMPRIME:
     move $s0, $zero     # i = 0 ($s0 é i)  
     ILOOP:      
      # configurações do FOR      
      slt $t0, $s0, $s3      # t0 = 0 se $s0 >= $s3 ( i >= n), t0 = 1 caso contrário
      beq $t0, $zero, EXIT   # se $s0 >= $s3 ( i >= n) vá para EXIT      
  
      # configuração do ARRAY      
       sll $t1, $s0, 2      # $t1 = 4 * i (4 * $s0)      
       add $t2, $s4, $t1    # t2 = ( vetor + ( 4 * i) )      
       lw $t3, 0($t2)       # $t3 = vetor[i]      
       
      # imprimindo o inteiro   
         li $v0, 1   
         move $a0, $t3   
         syscall 
     # imprimindo a string   
         li $v0, 4   
         la $a0, $LS   
         syscall
      # configurações do FOR      
       addi $s0, $s0, 1       # $s0 = $s0 + 1 (ou i = i + 1) é o contador      
      j ILOOP                 # volta para o LOOP  

 EXIT2:  
 
 EXIT: 
 
               
.data 
$LS: .asciiz " "
Vetor: .word 35 2 1 0 10
aux_vector: .space 20
