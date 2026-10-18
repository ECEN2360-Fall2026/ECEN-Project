.text

# Part 1.1: int sum_two(int a, int b);
.global sum_two
sum_two:
	# implement this ABI-compliant function



# since we have 2 arguments a and b it can only equal to r4,r5 -- these are the r-type that create the arguments
#r4=a
#r5=b

# now we have to add the values and store it into r2 because that is the return instruction
# this is format: add destination registor, source register 1, source register 2
add r2,r4,r5

# now we have to return the value using the ret instruction
ret

	
	