# codigo que utiliza o SWITCH-CASE e imprime a opcao valida

.data
entradaValor: .asciiz "escolha um numero\n"
opcao1: .asciiz "1"
opcao2: .asciiz "2"
opcao3: .asciiz "3"
opcao4: .asciiz "4"
opcao5: .asciiz "5"
opcao6: .asciiz "6"
opcaoInvalida: .asciiz "OPÇÃO INVALIDA\n"

.text
main:
	# entrada de um valor
	li $v0, 4
	la $a0, entradaValor
	syscall
li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4

	# verifica se tem o valor no switch
	blt $t0, 1, op0
	bgt $t0, 6, op0

	# direciona para a opção escolhida
	beq $t0, 1, op1
	beq $t0, 2, op2
	beq $t0, 3, op3
	beq $t0, 4, op4
	beq $t0, 5, op5
	beq $t0, 6, op6

	# switch
	op1:
	la $a0, opcao1
	syscall
	j fimDoPrograma

	op2;
	la $a0, opcao2
	syscall
	j fimDoPrograma

	op3:
	la $a0, opcao3
	syscall
	j fimDoPrograma

	op4:
	la $a0, opcao4
	syscall
	j fimDoPrograma

	op5:
	la $a0, opcao5
	syscall
	j fimDoPrograma

	op6:
	la $a0, opcao6
	syscall
	j fimDoPrograma

	# case
	op0:
	la $a0, opcaoInvalida
	syscall
	j main

	fimDoPrograma:
	li $v0, 10
	syscall
