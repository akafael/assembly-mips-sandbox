##
# Hello World
# "Print a mensage using the default I/O"
# @author Rafael Lima
##

.eqv PRINT_INT_SERVICE 1
.eqv READ_INT_SERVICE 5

.data

.text 
.macro print_num %num
	li $v0 , PRINT_INT_SERVICE
	add $a0, $zero, %num
	syscall
	li $v0 , 11
	addi $a0, $zero, '\n'
	syscall
.end_macro

.macro read_limit_count
	li $v0 , READ_INT_SERVICE
	syscall 
	add $s1 , $zero , $v0
.end_macro

main:
	read_limit_count
	jal loop1
loop1:
	addi $t1,$t1 ,1
	print_num $t1
	bne $t1,$s1,loop1
