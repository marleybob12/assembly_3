# Lista 2 - Exercicio 4: novo salario com aumento de 25% (apenas inteiros)
.data
msg_in:  .asciiz "Digite o salario atual: "
msg_out: .asciiz "Novo salario (+25%): "

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg_in
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0            # salario

    li   $t1, 25
    mul  $t2, $t0, $t1       # salario * 25
    li   $t3, 100
    div  $t2, $t3            # / 100
    mflo $t2                 # aumento
    add  $t4, $t0, $t2       # novo salario

    li   $v0, 4
    la   $a0, msg_out
    syscall
    li   $v0, 1
    move $a0, $t4
    syscall

    li   $v0, 10
    syscall
