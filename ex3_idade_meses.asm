# Lista 2 - Exercicio 3: idade em meses
# meses = (anoAtual - anoNasc) * 12 + (mesAtual - mesNasc)
.data
msg_mn: .asciiz "Mes de nascimento: "
msg_an: .asciiz "Ano de nascimento: "
msg_ma: .asciiz "Mes atual: "
msg_aa: .asciiz "Ano atual: "
msg_r:  .asciiz "Idade em meses: "

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg_mn
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0            # mes nascimento

    li   $v0, 4
    la   $a0, msg_an
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0            # ano nascimento

    li   $v0, 4
    la   $a0, msg_ma
    syscall
    li   $v0, 5
    syscall
    move $t2, $v0            # mes atual

    li   $v0, 4
    la   $a0, msg_aa
    syscall
    li   $v0, 5
    syscall
    move $t3, $v0            # ano atual

    sub  $t4, $t3, $t1       # anos
    li   $t5, 12
    mul  $t4, $t4, $t5       # anos * 12
    sub  $t6, $t2, $t0       # diferenca de meses
    add  $t4, $t4, $t6       # total em meses

    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $t4
    syscall

    li   $v0, 10
    syscall
