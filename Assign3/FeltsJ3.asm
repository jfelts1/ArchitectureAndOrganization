.text
.globl main
main:
    addi $s0,$0,11  #$s0 is the register to hold the loop count value
    la $s1,array1   #load the address of array1 into $s1
    la $t0,array0   #load the address of array0 into $t0
loopStart:
    beq $s0,$0,exit #if the loop register is zero jump to exit
     
    lw $t2,0($t0)   #load the word that $t0 is pointing to
    and $t1,$t2,1   #check if num is odd
      
    bne $t1,$0,odd  #if $t1 is 0 then $s0 is odd
       
    addi $v0,$0,4   #print evennum
	la $a0,evenstr
	syscall
	
	sw $t2,0($s1)   #store the number from array0 into array1
	lw $t7,0($s1)   #load the value from the array to check if it was copied correctly
	
	addi $v0,$0,1   #print number
	add $a0,$0,$t7
	syscall	
	addi $v0,$0,4   #print newline
	la $a0,newline
	syscall
	
	addi $s1,$s1,4  #increment the address by 4 bytes
	
	j loopDec
odd:   
    #addi $v0,$0,4   #print oddstr
	#la $a0,oddstr
	#syscall
loopDec: 
	addi $s0,$s0,-1 #decrement s0
	addi $t0,$t0,4  #move array0 pointer 4 bytes
    j loopStart
exit:
	addi $v0,$0,10  #exit program 
	syscall
    
.data
array0: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array1: .space 44

oddnum: .word 5
evennum: .word 4
evenstr: .asciiz "Number is even\n"
.align 2
oddstr: .asciiz "Number is odd\n"
.align 2
newline: .asciiz "\n"
