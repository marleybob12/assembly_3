# Lista 2 - Exercicio 5: analisa o delta de uma equacao de 2o grau
# delta = B*B - 4*A*C
# (mensagens sem acento para evitar problemas de codificacao no MARS)
.data
msg_a:  .asciiz "Digite o coeficiente A: "
msg_b:  .asciiz "Digite o coeficiente B: "
msg_c:  .asciiz "Digite o coeficiente C: "
duas:   .asciiz "DUAS RAIZES REAIS"
uma:    .asciiz "UMA RAIZ REAL"
nenhuma: .asciiz "NAO EXISTEM RAIZES REAIS"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg_a
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0            # A

    li   $v0, 4
    la   $a0, msg_b
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0            # B

    li   $v0, 4
    la   $a0, msg_c
    syscall
    li   $v0, 5
    syscall
    move $t2, $v0            # C

    mul  $t3, $t1, $t1       # B*B
    mul  $t4, $t0, $t2       # A*C
    sll  $t4, $t4, 2         # 4*A*C
    sub  $t5, $t3, $t4       # delta

    bgtz $t5, delta_pos
    beqz $t5, delta_zero

    la   $a0, nenhuma        # delta < 0
    j    imprime

delta_pos:
    la   $a0, duas
    j    imprime

delta_zero:
    la   $a0, uma

imprime:
    li   $v0, 4
    syscall

    li   $v0, 10
    syscall
