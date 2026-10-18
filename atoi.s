.text

# Part 1.5: int atoi(char *str);
.global atoi
atoi:
	# implement this ABI-compliant function

	# initialize sum to 0
	movia r2,0
	
	# initialize negate flag to 0
	movia r9,0
	
	# load the first character from the string
	ldb r8,0(r4)
	
	# check if the first character is a minus sign
	movi r10,45
	beq r8,r10,atoi_negative
	
	# now we have to process the digits
	br atoi_loop

atoi_negative:
	# set the negate flag to 1
	movia r9,1
	
	# move the string pointer to the next character
	addi r4,r4,1

atoi_loop:
	# load the next character from the string
	ldb r8,0(r4)
	
	# check if the character is less than '0'
	movi r10,48
	blt r8,r10,atoi_done
	
	# check if the character is greater than '9'
	movi r10,57
	bgt r8,r10,atoi_done
	
	# multiply the current sum by 10
	movi r10,10
	mul r2,r2,r10
	
	# subtract ASCII '0' to get the digit value
	subi r8,r8,48
	
	# add the digit to the sum
	add r2,r2,r8
	
	# move the string pointer to the next character
	addi r4,r4,1
	
	# repeat the loop
	br atoi_loop

atoi_done:
	# check if the number is negative
	beq r9,r0,atoi_return
	
	# negate the sum
	sub r2,r0,r2

atoi_return:
	# return the integer value
	ret