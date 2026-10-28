# Lista 2 - Exercicio 7: separa centena, dezena e unidade (entrada de 100 a 999)
.data
msg_in:  .asciiz "Digite um numero entre 100 e 999: "
msg_err: .asciiz "Numero invalido! Tente novamente.\n"
txt_c:   .asciiz "CENTENA = "
txt_d:   .asciiz "\nDEZENA = "
txt_u:   .asciiz "\nUNIDADE = "

.text
.globl main
main:
leitura:
    li   $v0, 4
    la   $a0, msg_in
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

    blt  $t0, 100, invalido
    bgt  $t0, 999, invalido
    j    calcula

invalido:
    li   $v0, 4
    la   $a0, msg_err
    syscall
    j    leitura

calcula:
    li   $t1, 100
    div  $t0, $t1
    mflo $t2                 # centena
    mfhi $t3                 # resto (0 a 99)

    li   $t1, 10
    div  $t3, $t1
    mflo $t4                 # dezena
    mfhi $t5                 # unidade

    li   $v0, 4
    la   $a0, txt_c
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 4
    la   $a0, txt_d
    syscall
    li   $v0, 1
    move $a0, $t4
    syscall

    li   $v0, 4
    la   $a0, txt_u
    syscall
    li   $v0, 1
    move $a0, $t5
    syscall

    li   $v0, 10
    syscall
