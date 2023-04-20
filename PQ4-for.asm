# codigo que utiliza o comando FOR
# para fazer uma soma

.data
novaLinha : .asciiz "\n"
espaço : .asciiz " "

.text
main:
	# entrada do valor
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, novaLinha
	syscall
	
	# inicia a variavel soma com zero
	li $v0, 0

loopFor:
	
	# entra no loop, faz a soma com o contador
	bgt $t0, $t1, finalizaPrograma
	addi $t0, $t0, 1	# acrescenta +1 no contador
	add $v0, $v0, $t1
	j loopFor

finalizaPrograma:

	# imprime a soma
	li $v0, 1
	move $a0, $t0
	syscall

	# finaliza o programa
	li $v0, 10
	syscall
