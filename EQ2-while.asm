# codigo que utiliza o while
# questão pede que crie um vetor de inteiros de tamanho N
# usando o comando WHILE e imprima ele no final

.data
vetor: .space 30 
tamanho: .word 0 
valor: .word 0 # Valor a ser lido
espaco: .asciiz " " 

.text
main:
    	# entrada com o tamanho do vetor
    	li $v0, 5 
    	syscall
    	sw $v0, tamanho

    	# inicia o contador
    	li $t0, 0 

condicionalWhile:
        lw $t1, tamanho # carrega o tamanho do vetor
        blt $t0, $t1, ler # condicional, contador < tamanho, +1
        j preparandoImpressao # caso nao satisfaça a condicao, termina o loop
        
ler:
	# entrada de valores no vetor
        li $v0, 5
        syscall
        sw $v0, valor
        
        # armazenamento dos valores na memoria
        sll $t2, $t0, 2
        la $t3, vetor # carrega o endereço do vetor
        add $t3, $t3, $t2 # usa o contador para andar pelo vetor
        lw $t4, valor # carrega o valor lido
        sw $t4, ($t3) # armazena o valor no vetor
        addi $t0, $t0, 1 # incrementa +1
        j condicionalWhile

preparandoImpressao:
	li $t0, 0 # contador para percorrer o vetor
    	lw $t1, tamanho # carrega o tamanho do vetor
   	
loopPrint:
        blt $t0, $t1, print # se contador < tamanho, imprime o elemento
        j fimDoPrograma
        
print:
	#impressao do vetor
        sll $t2, $t0, 2
        la $t3, vetor 
        add $t3, $t3, $t2 
        lw $a0, ($t3) 
        li $v0, 1 
        syscall
        la $a0, espaco
        li $v0, 4 
        syscall
        addi $t0, $t0, 1 
        j loopPrint

fimDoPrograma:
    li $v0, 10	
    syscall
