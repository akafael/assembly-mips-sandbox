##
# Bubble Sort
# @author Rafael
# @version 2.- Modificado para estudo de complexidade
##

.eqv N 19

.data
vetor:  .word 1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100
vetor2 .word 100,90,80,70,60,50,40,30,20,10,9,8,7,6,5,4,3,2,1
newl:	.asciiz "\n"
tab:	.asciiz "\t"

.text	
MAIN:
	li $v0,5
	syscall
	
	add $a1,$0,$v0
	la $a0,vetor
	jal sort

swap:	sll $t1,$a1,2
	add $t1,$a0,$t1
	lw $t0,0($t1)
	lw $t2,4($t1)
	sw $t2,0($t1)
	sw $t0,4($t1)
	jr $ra

sort:	addi $sp,$sp,-20
	sw $ra,16($sp)
	sw $s3,12($sp)
	sw $s2,8($sp)
	sw $s1,4($sp)
	sw $s0,0($sp)
	move $s2,$a0
	move $s3,$a1
	move $s0,$zero
for1:	slt $t0,$s0,$s3
	beq $t0,$zero,exit1
	addi $s1,$s0,-1
for2:	slti $t0,$s1,0
	bne $t0,$zero,exit2
	sll $t1,$s1,2
	add $t2,$s2,$t1
	lw $t3,0($t2)
	lw $t4,4($t2)
	slt $t0,$t3,$t4
	beq $t0,$zero,exit2
	move $a0,$s2
	move $a1,$s1
	jal swap
	addi $s1,$s1,-1
	j for2
exit2:	addi $s0,$s0,1
	j for1
exit1: 	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addi $sp,$sp,20
	jr $ra


show:	move $t0,$a0
	move $t1,$a1
	move $t2,$zero

loop1: 	beq $t2,$t1,fim1
	li $v0,1
	lw $a0,0($t0)
	syscall
	li $v0,4
	la $a0,tab
	syscall
	addi $t0,$t0,4
	addi $t2,$t2,1
	j loop1

fim1:	li $v0,4
	la $a0,newl
	syscall
	jr $ra
