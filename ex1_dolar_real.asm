# Lista 2 - Exercicio 1: converte dolar (US$) para real (R$), cotacao = R$5
.data
msg_in:  .asciiz "Digite o valor em dolar (US$): "
msg_out: .asciiz "Valor em reais (R$): "

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg_in
    syscall

    li   $v0, 5              # le inteiro
    syscall
    move $t0, $v0

    li   $t1, 5              # cotacao
    mul  $t2, $t0, $t1       # reais = dolar * 5

    li   $v0, 4
    la   $a0, msg_out
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 10
    syscall
