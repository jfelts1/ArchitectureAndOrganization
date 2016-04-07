.text
.globl main
main:
	addi $v0,$0, 4
	la $a0,hello
	syscall
	
	addi $v0,$0,10
	syscall
.data
	hello: .asciiz "Hello World"
