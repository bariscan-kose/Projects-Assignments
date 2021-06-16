	.data
	
	selectionFile: .asciiz "selection_sort_out.txt"
	insertionFile: .asciiz "insertion_sort_out.txt"
	inputFile: .asciiz "input.txt"
	inputBuffer:	.space 1000
	outputBuffer:	.space 1000
	arrayLength:	.word 10
	stringLength:	.word 10
	array:	.space 80
	arrayInsert: .space 80
	arraySelect: .space 80
	stringStorage: .space 5000
	
	.text
	.globl _start
	
_start:
	move $t8,$zero
	li $v0,13	#open file
	la $a0,inputFile	#filename
	li $a1,0	#read flag
	syscall			
	move $s5,$v0 	#input file descriptor
	
	li $v0,14	#read file
	move $a0, $s5 #file descriptor
	la $a1, inputBuffer	#buffer that file is read into
	la $a2,512 	#buffer length
	syscall
	
	li $v0, 4		#print inputBuffer
	la $a0, inputBuffer
	syscall
	
	add $t1,$zero,$zero
	add $t3,$zero,$zero
getLength:	
	lb $t5, inputBuffer($t1)
	seq $t6,$t5,10
	add $t3,$t3,$t6
	addi $t1,$t1,1
	bne $t5,0, getLength
	sw $t3, arrayLength
	sw $t1, stringLength
	
arrayStart:
	add  $t1,$zero,$zero	#array counter increment
	add $t3,$zero,$zero
	add $t5,$zero,$zero
	la $s2, stringStorage
	la $s3, inputBuffer
	lw $t4, arrayLength
puttingStringToArray:
	
	beq $t1,$t4,sorting
	add $t0,$zero,$zero	# t0 array address increment
	sw $s2, array($t5)
	jal objectCopy 	#get the object length at t0 and copy the object
	addi $t3,$t3,20
	addi $t5,$t5,4
	la $s2, stringStorage
	add $s2,$s2,$t3
	#add $s3,$s3,$t0
	addi $t1,$t1,1
	
	b puttingStringToArray
	
sorting:
	
	beq $s7,1,insertionSort
selectionSort:
	la $s0, array
	lw $s1, arrayLength
	addi $s1,$s1,-1
	la $s2, arraySelect
	add $t0,$zero, $zero #array start index 
selection:
	add $t3,$t0,$zero    #this is the smallest index
	add $t1,$t0,$zero    #for searching through indexes of the whole array
	add $t2,$zero,$zero  #for searching through the next letter in the word	
	sll $t5,$t1,2
	add $t5,$t5,$t2
	lw  $t7, array($t5)
	lb  $s5, ($t7) #s5 register holds the smallest first letter
indexWalk:
	
	beq $t1,$s1,searchDone
	add $t2,$zero,$zero
	add $t1,$t1,1
	sll $t5,$t1,2
	add $t5,$t5,$t2
	lw  $t7, array($t5)
	lb $s4, ($t7)
	blt $s4,$s5, s4Smaller
	beq $s4,$s5, bothLetterSame
	b   indexWalk
s4SmallerInside:
	lw $t7,array($t5)
	lb $s4,($t7)
s4Smaller:
	move $s5,$s4
	move $t3,$t1
	b indexWalk
bothLetterSame:
	
	sll $t5,$t3,2
	#add $t5,$t5,$t2
	lw  $t7, array($t5)
	lh  $s6,($t7)
	srl $s6,$s6,8
	sll $t5,$t1,2
	#add $t5,$t5,$t2
	lw  $t7, array($t5)
	lh $s4,($t7)
	srl $s4,$s4,8
	ble $s4,$s6, s4SmallerInside
	b indexWalk
searchDone:	
	sll $t5,$t3,2
	lw $s3, array($t5) #smallest element
	sll $t6,$t0,2
	lw  $s2, array($t6) #element position
	sw $s3,array($t6)
	sw $s2, array($t5)
	addi $t0,$t0,1
	bne $t0,$s1,selection

	move $t4,$zero
	addi $s1,$s1,1
arrayCopy:	
	sll $t5,$t4,2
	lw  $t3,array($t5)
	sw  $t3,arraySelect($t5)
	addi $t4,$t4,1
	bne $t4,$s1,arrayCopy 	#copying array to arraySelect
	addi $s7,$zero,1
	b arrayStart
	
insertionSort:
	la $s0, array
	lw $s1, arrayLength
	addi $t0,$zero, 1 #array start index 
insertion:
	add $t1,$t0,$zero    #for searching through indexes of the whole array
	sll $t5,$t1,2
	lw  $t7, array($t5)
	lb  $s5, ($t7) #s5 register holds the smallest first letter
indexWalk2:
	beq $t1,0,searchDone2
	add $t1,$t1,-1
	sll $t5,$t1,2
	lw  $t7, array($t5)
	lb $s4, ($t7)
	bgt $s4,$s5, leftBigger
	beq $s4,$s5, bothLetterSame2
	b   indexWalk2

leftBigger:
	sll $t5,$t1,2
	lw $s2, array($t5)	#swapping the left element with the right element
	addi $t1,$t1,1
	sll $t5,$t1,2
	lw $s3, array($t5)
	sw $s2, array($t5)
	addi $t1,$t1,-1
	sll $t5,$t1,2
	sw $s3, array($t5)	#s5 of the main element doesn't change so it can continnue iterating downwards
	b indexWalk2
bothLetterSame2:
	lw  $t7, array($t5)
	lh  $s6,($t7)
	srl $s6,$s6,8	#s6 is the left element's second letter
	addi $t1,$t1,1
	sll $t5,$t1,2
	lw  $t7, array($t5)
	lh $s4,($t7)
	srl $s4,$s4,8	#s4 is the right element's second letter
	addi $t1,$t1,-1
	bgt $s6,$s4, leftBigger
	b indexWalk2
searchDone2:	

	addi $t0,$t0,1
	bne $t0,$s1, insertion

	move $t4,$zero
	addi $s1,$s1,1
arrayCopy2:	
	sll $t5,$t4,2
	lw  $t3,array($t5)
	sw  $t3,arrayInsert($t5)
	addi $t4,$t4,1
	bne $t4,$s1,arrayCopy2 	#copying array to arrayInsert	
	
	
openingOutputFiles:
	li $v0, 13	#open file
	la $a0,selectionFile	#filename	
	li $a1,1	#write flag
	li $a2,0	#ignore mode
	syscall
	move $s6,$v0	#s6 has selection sort file descriptor
	
	li $v0, 13
	la $a0,insertionFile
	li $a1,1
	li $a2,0
	syscall
	move $s7,$v0  #s7 has insertion sort file descriptor
	
writingToFiles:

	add     $t3,$zero,$zero     # index of array
    	add   	$t1,$zero,$zero         # address offset
    	lw 	$t4, arrayLength
    	lw	$t5, stringLength
    	la	$s2,outputBuffer
    	
selectionSortWrite:
    	la 	$s4, arraySelect
    	add	$s4,$s4,$t1
    	lw 	$s3,($s4)
    	jal	objectCopy
    	addi	$t3,$t3,1
    	addi	$t1,$t1,4
    	bne 	$t3,$t4,selectionSortWrite
	li 	$v0, 15	#writing buffer to file
	move	$a0, $s6	#file descriptor selection sort
	la 	$a1, outputBuffer	#what to write	
	lw	$a2, stringLength	#how many characters to write
	addi 	$a2,$a2,-1
	syscall
	
	add     $t3,$zero,$zero     # index of array
    	add   	$t1,$zero,$zero         # address offset
    	lw 	$t4, arrayLength
    	lw 	$t5, stringLength
    	la	$s2,outputBuffer
insertionSortWrite:
    	la 	$s4, arrayInsert
    	add	$s4,$s4,$t1
    	lw	$s3,($s4)
    	jal	objectCopy
    	addi	$t3,$t3,1
    	addi	$t1,$t1,4
    	bne 	$t3,$t4,insertionSortWrite
	li 	$v0, 15	#writing buffer to file
	move	$a0, $s7	#file descriptor insertion sort	
	la 	$a1, outputBuffer	#what to write	
	lw	$a2, stringLength	#how many characters to write
	addi 	$a2,$a2,-1
	syscall
	
closingDescriptors:
	li $v0,16	#closing file
	move $a0,$s6 	#filedescriptor
	syscall 
	li $v0, 16
	move $a0,$s7
	syscall
	li $v0, 16
	move $a0,$s5
	syscall
done:
	li $v0,10
	syscall	
	
objectCopy:
	lb     	$t2,0($s3)          # get char from inputBuffer
	sb 	$t2,0($s2)	      #set char to stringStorage
	addi $s3,$s3,1
	addi $s2,$s2,1
	addi 	$t0,$t0,1	#t0 gives how many characters are in string object       
	bne     $t2,10,objectCopy    # is it EOS?  if no, loop some more
	jr      $ra

