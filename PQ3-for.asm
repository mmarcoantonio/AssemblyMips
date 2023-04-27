# questao pede que utilize o comando for
# para imprimir entre intervalo
# uma quantidade N de numeros 

.data
novaLinha : .asciiz "\n"
espaço : .asciiz " "

.text
main:
	# entrada do valor inicio
	li $v0, 5
	syscall
	move $t1, $v0
	
	#entrada do valor final
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0, novaLinha
	syscall

loopFor:
	li $v0, 1
	move $a0, $t1 # aciona o syscall
	syscall
	add $t1, $t1, 1 # incrementa +1 no valor inicio
	li $v0, 4
	la $a0, espaço
	syscall
	ble $t1, $t2, loopFor # condicional para saber se o valor inicio eh maior que o valor final

	# finaliza o programa
	li $v0, 10
	syscall
