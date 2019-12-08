##
#
##



.macro print_int %x
	li $v0, 1 # Load the type od Service ( Print Interger)
	add $a0, $zero, %x # Set the service parameters
	syscall # Call the service
.end_macro

