.text

# Part 1.2: int mod(int a, int b);
.global mod
mod:
	# implement this ABI-compliant function

# we have 2 arguments and they are stored in r4 and r5
# r4 = a
# r5 = b

# this is the format that it is written: div destination register, source register 1, source register 2
# we store it in r6 instead of r2 because r2 holds the final answer not the quotient
# we use r6 because it holds the temporary quotient
div r6,r4,r5

# now we have to calculate the remainder so use the mul instruction
# mul destination, source1, source2
mul r7,r5,r6

# this multiplies the divisor by the quotient and stores the product in r7
# in this case r5 is the divisor, r6 is the quotient, and r7 is the product

# now do the subtraction to get the remaider
sub r2,r4,r7

# now return the remainder using the ret instruction
ret