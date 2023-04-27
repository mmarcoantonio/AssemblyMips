# questão pede que, dado uma entrada N, use o FOR para imprimir essa quantidade N
# de números 

.data
novaLinha : .asciiz "\n"

.text
main:
	# entrada de valor
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, novaLinha
	syscall

loopFor:
	li $v0, 1
	move $a0, $t0 # aciona o syscall
	syscall
	add $t0, $t0, 1 # incrementa +1
	ble $t0, $t1, loopFor # condicional para saber se o contador I eh maior que o valor digitado

	# finaliza o programa
	li $v0, 10
	syscall
