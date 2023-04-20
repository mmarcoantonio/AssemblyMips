# codigo que pede utiliza o if/else/then
# questao pede que, com a entrada de dois valores (I e J),
# se I==J: F = I+J+100 e imprima F
# senao F = I+J+50 e imprima F
# saindo do condicional imprima I+J

.data
entradaI:	.asciiz "Entrada do primeiro valor: "
entradaJ:	.asciiz "Entrada do segundo valor: "
novaLinha:	.asciiz "\n"
resultadoF:	.asciiz "Valor de F: "
resultadoIJ:	.asciiz "Valor de I + J: "

.text
main:

	# leitura do primeiro valor
	li $v0, 4
	la $a0, entradaI
	syscall 
	li $v0, 5       # funcao 5 syscall = leitura de inteiro
	syscall         
	move $s0, $v0   # move e armazena o valor lido em $s0    

	# leitura do segundo valor
	li $v0, 4
	la $a0, entradaJ
	syscall
	li $v0, 5       # funcao 5 syscall = leitura de inteiro
	syscall         
	move $s1, $v0   # move e armazena o valor lido em $s1

	# if
	beq $s0, $s1, condicional # se i == j, vai pra funcao condicional
	
	# else
	add $s2, $s0, $s1 # calcula f = (i + j) + 50
	addi $s2, $s2, 50
	j impressao # vai para a funcao impressao
	
condicional:
	add $s2, $s0, $s1 # calcula f = (i + j) + 100
	addi $s2, $s2, 100

impressao:

	# impressao do f
	li $v0, 4
	la $a0, resultadoF
	syscall 
	li $v0, 1       # funcao 5 syscall = leitura de inteiro
	move $a0, $s2   # move valor de $s2 para $a0 e carrega
	syscall          

	# pula de linha
	li $v0, 4
	la $a0, novaLinha
	syscall 

	# impressao de i + j
	li $v0, 4
	la $a0, resultadoIJ
	syscall 
	add $s2, $s0, $s1 # soma de i + j e armazena em $s2
	li $v0, 1       # funcao 1 syscall = impressa de inteiro
	move $a0, $s2   # move o resultado de $s2 para $a0 e carrega
	syscall         

	# sai do programa
	li $v0, 10      
	syscall
