# codigo que le, armazena no registro, recupera e imprime uma string

.data
entrada:        .space 31	#reserva espaço de memoria, sendo 30 espaço para caracteres + 1 espaço (char = 1 byte)
tamanhoEntrada:    .word 30	# guarda 30 bytes na memoria

.text
main:

    # entrada da string. 
    li $v0, 8	# funcao 8 do syscall = entrada de strings
    la $a0, entrada
    lw $a1, tamanhoEntrada
    syscall

    # saida da string
    li $v0, 4	# funcao 4 do syscall = impressao de strings
    la $a0, entrada
    syscall

    # fim do programa
    li $v0, 10	# funcao 10 do syscall = sai do programa
    syscall
