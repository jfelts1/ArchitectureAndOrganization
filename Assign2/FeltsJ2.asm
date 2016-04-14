.text
.globl main
main:
	#read in integer one into register s0
	addi $v0,$0,5
	syscall
	addi $s0, $v0,0
	
	#read in integer two into register s1
	addi $v0,$0,5
	syscall
	addi $s1, $v0,0
	
	#add int1 and int2
	add $a0, $s0, $s1
	sw $a0, sum
	
	#diff int1 and int2
	sub $a1,$s0,$s1
	sw $a1,diff
	
	#print sumstr
	addi $v0,$0,4
	la $a0,sumstr
	syscall
	#print sum
	addi $v0, $0,1
	lw $a0,sum
	syscall
	
	#print diffstr
	addi $v0,$0,4
	la $a0,diffstr
	syscall
	#print diff
	addi $v0, $0,1
	lw $a0,diff
	syscall
	#exit program 
	addi $v0,$0,10
	syscall
.data
	sum: .word 1
	diff: .word 1
	sumstr: .asciiz "sum="
	diffstr: .asciiz "diff="
