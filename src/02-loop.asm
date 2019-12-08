##
# LOOP 1.0
# "Count 1 to n and print on Output"
# @author Rafael Lima
##

# syscall services used:
.eqv SERVICE_PRINT_INT 1
.eqv SERVICE_READ_INT 5
.eqv SERVICE_PRINT_CHAR 11

.text
main:
	# Read a number and save in $s1:
	li $v0 , SERVICE_READ_INT
	syscall 
	add $s1 , $zero , $v0
	
	jal loop1
loop1:
	addi $t1,$t1 ,1

	# Print the actual value of $t1
	li $v0 , SERVICE_PRINT_INT
	add $a0, $zero, $t1
	syscall
	
	# Print ' '
	li $v0 , SERVICE_PRINT_CHAR
	addi $a0, $zero, ' '
	syscall

	bne $t1,$s1,loop1
