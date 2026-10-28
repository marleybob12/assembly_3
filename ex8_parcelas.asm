# Lista 2 - Exercicio 8: numero de parcelas da Loja Vende Tudo
# Compra: 1000 a 9999 | Parcela: 100 a 500 | ultima parcela pode ser menor
# parcelas = valor / parcela (+1 se sobrar resto)
.data
msg_v:   .asciiz "Valor da compra (1000 a 9999): "
msg_p:   .asciiz "Valor da parcela (100 a 500): "
msg_err: .asciiz "Valor invalido! Tente novamente.\n"
msg_r:   .asciiz "Numero de parcelas: "

.text
.globl main
main:
le_valor:
    li   $v0, 4
    la   $a0, msg_v
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0
    blt  $t0, 1000, valor_inv
    bgt  $t0, 9999, valor_inv
    j    le_parcela

valor_inv:
    li   $v0, 4
    la   $a0, msg_err
    syscall
    j    le_valor

le_parcela:
    li   $v0, 4
    la   $a0, msg_p
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0
    blt  $t1, 100, parc_inv
    bgt  $t1, 500, parc_inv
    j    calcula

parc_inv:
    li   $v0, 4
    la   $a0, msg_err
    syscall
    j    le_parcela

calcula:
    div  $t0, $t1
    mflo $t2                 # parcelas inteiras
    mfhi $t3                 # resto
    beqz $t3, mostra
    addi $t2, $t2, 1         # sobrou resto: mais uma parcela menor

mostra:
    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 10
    syscall
