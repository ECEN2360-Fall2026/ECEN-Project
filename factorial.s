.text

# Part 1.4: int factorial(int n);
.global factorial
factorial:
	# implement this ABI-compliant function

	# since there is 1 argument we have to make it equal 0 and go to factorial_base
	beq r4,r0,factorial_base

	# now we have to do the recursion part
	
	# make space on the stack for 2 values
	addi sp,sp,-8
	
	# save the original n and return address
	stw r4,0(sp)
	stw r31,4(sp)

	# calculate n-1 and pass it as the argument
	subi r4,r4,1
	
	# call factorial recursively
	call factorial

	# now we have to restore the original n and return address
	ldw r4,0(sp)
	ldw r31,4(sp)
	addi sp,sp,8

	# multiply n by factorial(n-1)
	mul r2,r4,r2

	# return the result
	ret

factorial_base:
	# now we have to store the result into r2
	movia r2,1

	# return the value here:
	ret