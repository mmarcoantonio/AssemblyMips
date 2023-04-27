# questao pede que, lendo dois inteiros N e M,
# se M > N: TMP = M, M = N, N = TMP
# senao: TMP = N + M
# e imprima TMP fazendo o uso do if/then/else

.data
novaLinha:	.asciiz "\n"

.text
main:

# leitura do primeiro valor
li $v0, 5       # funcao 5 syscall = leitura de inteiro
syscall         
move $s0, $v0   # move e armazena o valor lido em $s0    

# leitura do segundo valor
li $v0, 5       # funcao 5 syscall = leitura de inteiro
syscall         
move $s1, $v0   # move e armazena o valor lido em $s1

# if
slt $t1, $s1, $s0	# se N < M (M > N), $s1 recebe 0
beq $t1, $0, condicional	# se $t1 == 0, entra no condicional
	
# else
add $s2, $s0, $s1 # calcula TMP = M + N
j impressao # vai para a funcao impressao
	
condicional:
move $s2, $s0	# TMP = M
move $s0, $s1	# M = N
move $s1, $s2	# N = TMP

impressao:     

# pula de linha
li $v0, 4
la $a0, novaLinha
syscall 

# impressao de TMP
li $v0, 1       # funcao 1 syscall = impressa de inteiro
move $a0, $s2   # move o resultado de $s2 para $a0 e carrega
syscall         

# sai do programa
li $v0, 10      
syscall
