.data

array1: .word 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 # final 0 indicates the end of the array; 0 is excluded; it should return TRUE for this array
array2: .word 8, 9, 6, 7, 5, 4, 3, 2, 1, 0 # final 0 indicates the end of the array; 0 is excluded; it should return FALSE for this array

true: .asciiz "TRUE\n"
false: .asciiz "FALSE\n"
default: .asciiz "This is just a template. It always returns "

.text

main:

      #la $a0, array1
      la $a0, array2 # $a0 has the address of the A[0]
      jal lenArray  # Find the lenght of the array
      
      move $a1, $v0  # $a1 has the length of A
      move $a2,$a1
      jal Descending

      bne $v0, 0,  yes
      la  $a0, false
      li $v0, 4 #syscall with $v0=4 prints the memory till terminator \n
      syscall
      j exit

yes:  la    $a0, true
      li $v0, 4
      syscall

exit:
      li $v0, 10
      syscall #syscall with $v0=10 exits the program


Descending:
###############################################
#   Your code goes here
###############################################
# address of array 2 is still in a0
      
      addi $sp,$sp,-4
      sw  $ra, 0($sp)
Descending2:
      addi $a2,$a2,-1
      lw  $t2, 0($a0)
      lw  $t3, 4($a0)
      addi $a0,$a0,4
      slt $t1, $t3, $t2
      beq $a2,1,True
      beq $t1, 1, Descending2
      
False:    
      lw $ra, 0($sp)
      add $v0, $t1, $zero
      addi $sp, $sp, 4
      jr $ra

True:
      lw $ra, 0($sp)
      addi $v0, $zero, 1
      addi $sp, $sp, 4
      jr $ra

      
      
###############################################
# Everything in between should be deleted
###############################################
      jr $ra	# last jump return back to main loop where our job finishes

lenArray:       #Fn returns the number of elements in an array
      addi $sp, $sp, -8
      sw $ra,0($sp)
      sw $a0,4($sp)
      li $t1, 0

laWhile:       
      lw $t2, 0($a0)
      beq $t2, $0, endLaWh
      addi $t1,$t1,1
      addi $a0, $a0, 4
      j laWhile

endLaWh:
      move $v0, $t1
      lw $ra, 0($sp)
      lw $a0, 4($sp)
      addi $sp, $sp, 8
      jr $ra
