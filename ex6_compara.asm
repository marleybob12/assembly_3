# Lista 2 - Exercicio 6: dois numeros, iguais ou diferentes (maior e menor)
.data
msg1:    .asciiz "Digite o primeiro numero: "
msg2:    .asciiz "Digite o segundo numero: "
iguais:  .asciiz "Os numeros sao IGUAIS"
difer:   .asciiz "Os numeros sao DIFERENTES\n"
txt_mai: .asciiz "Maior: "
txt_men: .asciiz "\nMenor: "

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg1
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

    li   $v0, 4
    la   $a0, msg2
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0

    beq  $t0, $t1, sao_iguais

    li   $v0, 4
    la   $a0, difer
    syscall

    bgt  $t0, $t1, ordem_ok  # se $t0 > $t1 ja esta certo
    move $t2, $t0            # senao, troca para deixar $t0 = maior
    move $t0, $t1
    move $t1, $t2

ordem_ok:
    li   $v0, 4
    la   $a0, txt_mai
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 4
    la   $a0, txt_men
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    j    fim

sao_iguais:
    li   $v0, 4
    la   $a0, iguais
    syscall

fim:
    li   $v0, 10
    syscall
