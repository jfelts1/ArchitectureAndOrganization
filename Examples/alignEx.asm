.text
main:
    la $a0,str0
    addi $v0,$0,4
    syscall
    la $a0, var0
    lw $a0, 0($a0)
    addi $v0,$0,1
    syscall
    addi $v0, $0, 10
    syscall
.data
str0: .asciiz "Number="
.align 2
var0: .word 5
