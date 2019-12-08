##
# LOOP 2.0 - Macro Version
# "Count 1 to n and print on Output"
# @author Rafael Lima
##

# syscall services used:
.eqv SERVICE_PRINT_INT 1
.eqv SERVICE_READ_INT 5
.eqv SERVICE_PRINT_CHAR 11

# Print a number routine
.macro print_num %num
	
	# Print %num
	li $v0 , SERVICE_PRINT_INT
	add $a0, $zero, %num
	syscall
	
	# Print ' '
	li $v0 , SERVICE_PRINT_CHAR
	addi $a0, $zero, ' '
	syscall
.end_macro

# Read a number and set the limit
.macro read_limit_count
	li $v0 , SERVICE_READ_INT
	syscall 
	add $s1 , $zero , $v0
.end_macro

.text 
main:
	read_limit_count
	jal loop1
	
loop1:
	addi $t1,$t1 ,1
	print_num $t1
	bne $t1,$s1,loop1