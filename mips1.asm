#$a0 = address of the first element in the array
#$a1 = size of the array

Sel_Sort:		# sorting function
addi $sp, $sp, -12	# reserving 3 spaces in stack

sw $s0, 0($sp)		# storing $s0 in first stack position
sw $s1, 4($sp)		# storing $s1 in second stack position
sw $s2, 8($sp)		# storing $s2 in third stack position

li $s0, 0		# initializing $s0 with 0
li $s1, 0		# initializing $s1 with 0
li $s2, 0		# initializing $s2 with 0
li $t0, 0		# initializing $t0 with 0
li $t1, 0		# initializing $t1 with 0

fLoop:
beq $t0, $a1, end1	# loop until $t0 reaches $a1
sll $t1, $t0, 2		# multiply $t1 by 4
add $t1, $t1, $a0	# add $t1 to $a0 to get element at $t1
lw $s0, 0($t1)		# load element in $t1 to $s0
addi $t2, $t0, 1	# increment $t0 and store in $t2
addi $t0, $t0, 1	# increment $t0
sLoop:
bge $t2, $a1, fLoop	# branch to fLoop if $t2 reaches $a1
sll $t3, $t2, 2		# multiply $t2 by 4 and store in $t3
add $t3, $t3, $a0	# add $t3 to $a0 to get element at $t3
lw $s1, 0($t3)		# load element in $t3 to $s1
slt $t4, $s1, $s0	# if value in $s1 smaller than $s0, let $t4 contain 1, else let $t4 contain 0
addi $t2, $t2, 1	# increment $t2
beqz $t4, sLoop		# if $t4 equal 
add $t5, $s0, $0	# store $s0 in $t5 
sw $s1, 0($t1)		# store $s1 in element $t1
sw $s0, 0($t3)		# store $s0 in element $t3
j sLoop			#jump to sLoop

end1:
add $v0, $a0, $0	# store the sorted array in $v0 to be returned
lw $s0, 0($sp)		# load previous value of $s0 back in $s0 from stack
lw $s1, 4($sp)		# load previous value of $s1 back in $s0 from stack
lw $s2, 8($sp)		# load previous value of $s2 back in $s0 from stack
addi $sp, $sp, 12	# empty the stack and reset stack pointer
jr $ra			# jump back to address in $ra when function was called

Top_rank:
addi $sp, $sp, -4	# reserve 1 space in stack
sw $s0, 0($sp)		# store value in $s0 to stack
li $s0, 0		# initialize $s0 with 0
li $t0, 0		# initialize $t0 with 0
li $v0, 0		# initialize $v0 with 0

tLoop:
beq $t0, $a1, end2	# if value in $t0 reaches $a1, jump to end2
sll $t1, $t0, 2		# multiply value in $t0 by 4 and store in $t1
add $t1, $t1, $a0	# add $t1 to $a0 and store in $t1 to get element at $t1
lw $s0, 0($t1)		# load element in $t1 to $s0
bge $s0, $v0, greater	# if value in $s0 greater than or equal $v0, jump to greater
j tLoop			# jump to tLoop
greater:
add $v0, $s0, $0	#store $s0 to $v0 to be returned
j tLoop			# jump to tLoop

end2:
lw $s0, 0($sp)		# load previous value of $s0 to $s0 from stack
addi $sp, $sp, -4	# empty the stack and reset stack pointer
jr $ra			# jump back to address in $ra when function was called

Sem_abroad:
addi $sp, $sp, -4	# reserve 1 space in stack
sw $s0, 0($sp)		# store value in $s0 to stack
li $s0, 0		# initialize $s0 with 0
li $t0, 0		# initialize $t0 with 0
li $t2, 0		# initialize $t2 with 0
li $v0, 0		# initialize $v0 with 0
li $v1, 0		# initialize $v1 with 0

loop1:
beq $t0, $a1, end3	# if value in $t0 reaches $a1, jump to end3
sll $t1, $t0, 2		# multiply value in $t0 by 4 and store in $t1
add $t1, $t1, $a0	# add $t1 to $a0 and store in $t1 to get element at $t1
lw $s0, 0($t1)		# load element in $t1 to $s0
addi $t0, $t0, 1	# increment $t0
bge $s0, 70, greater1	# if value in $s0 greater than or equal 70, jump to greater1
j loop1			# else jump to loop1
greater1:
sll $t3, $t2, 2		# multiply value in $t2 by 4 and store in $t3
add $t3, $t3, $v0	# add value in $t3 to $v0 to get element at $t3
sw $t0, 0($t3)		# store the number of student at element $t3 in $v0 to return the array of students
addi $t2, $t2, 1	# increment $t2
addi $v1, $v1, 1	# increment $v1 to return number of eligible students
j loop1			# jump to loop1

end3:
lw $s0, 0($sp)		# load previous value of $s0 back to $s0 from stack
addi $sp, $sp, 4	# empty the stack and reset stack pointer
jr $ra			# jump back to address in $ra when function was called