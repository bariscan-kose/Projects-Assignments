##
## template for your assembly programs
##
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################

	.text		
       .globl __start 
__start:		# execution starts here

	
	# say hello
	la $a0,starting
	li $v0,4
	syscall
	
		
	#############################
	# load the fp number in a fp register (just for printing)
	l.d $f0, X
	jal message5a
	# print X
	mov.d $f12, $f0
	li $v0, 3
	syscall
	

	# load the fp number in an integer register $t0 and $t1 (the operations must be performed on $t0 and $t1)
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	
	
	# YOUR CODE GOES HERE

	lui $t4, 0x0030
	sub  $t1,$t1,$t4 
	lui $t4, 0x8000
	xor $t1, $t1, $t4
	
	# MY CODE WENT HERE
	
	mtc1 $t0,$f0
	mtc1 $t1,$f1
	
	jal message5b
	
	
	# store the $f0 result in memory
	# print X/(-4)
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	
	#######################
	#######################
	# say good bye
	la $a0,endl
	li $v0,4
	syscall

	# exit call
	li $v0,10
	syscall		# au revoir...


############## messages


message5a:
	la $a0,mes5a
	j message	

message5b:
	la $a0,mes5b
	j message

message:
	li $v0,4
	syscall
	jr $ra

#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
starting:	.asciiz "\n\nProgram Starts Here ...\n"
endl:	.asciiz "\n\nexiting ..."


X: .double 10.00


mes5a:	.asciiz "\n\nX: "
mes5b:	.asciiz "\n\nX/(-8): "
##
## end of file fib.a
