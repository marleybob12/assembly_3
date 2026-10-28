# Lista 2 - Exercicio 2: troca o valor de dois registradores
.data
msg1:   .asciiz "Digite o primeiro valor: "
msg2:   .asciiz "Digite o segundo valor: "
antes:  .asciiz "\nAntes da troca:\n"
depois: .asciiz "\nDepois da troca:\n"
txt1:   .asciiz "Registrador 1 = "
txt2:   .asciiz "\nRegistrador 2 = "
nl:     .asciiz "\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg1
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0            # $t0 = primeiro valor

    li   $v0, 4
    la   $a0, msg2
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0            # $t1 = segundo valor

    li   $v0, 4
    la   $a0, antes
    syscall
    jal  mostra

    move $t2, $t0            # troca usando registrador auxiliar
    move $t0, $t1
    move $t1, $t2

    li   $v0, 4
    la   $a0, depois
    syscall
    jal  mostra

    li   $v0, 10
    syscall

# imprime $t0 e $t1
mostra:
    li   $v0, 4
    la   $a0, txt1
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, txt2
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra
