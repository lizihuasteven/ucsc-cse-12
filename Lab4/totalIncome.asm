totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	
	# Start your coding from here!
	#if no student code entered, a0 just returns 0 always :(
	li a0, 0
	li t0,0x30
	li t1,0x39
	li t2,0x10040000
        
totalIncome_file_loop:
	li  t4,0	
	lbu t3,7(t2)
	slli t3,t3,24
	add t4,t4,t3
	
	lbu t3,6(t2)
	slli t3,t3,16
	add t4,t4,t3
	
	
	lbu t3,5(t2)
	slli t3,t3,8
	add t4,t4,t3
	
	lbu t3,4(t2)
	add t4,t4,t3
	li t5,0
total_ONE_loop:	
	lbu t3,(t4)
	sub  t3,t3,t0
	add  t5,t5,t3
	
	lbu t3,1(t4)
	bltu t3,t0,totalIncome_file_over
	bgtu t3,t1,totalIncome_file_over
        li t3,9
        addi t6,t5,0
total_tow_loop:	
	add  t5,t5,t6
	addi t3,t3,-1
	bnez t3,total_tow_loop
	
	addi t4,t4,1
	j total_ONE_loop
totalIncome_file_over:	
	add a0,a0,t5
	addi t2,t2,8
	addi  a1,a1,-1
	bnez a1,totalIncome_file_loop
	

# End your  coding  here!
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
