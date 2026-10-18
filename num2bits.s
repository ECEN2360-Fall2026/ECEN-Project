.text

# Part 1.6
.global num2bits
num2bits:
	# implement this ABI-compliant function
.data
.align 2

Bits7seg:
	.byte 0x40	# 0
	.byte 0x79	# 1
	.byte 0x24	# 2
	.byte 0x30	# 3
	.byte 0x19	# 4
	.byte 0x12	# 5
	.byte 0x02	# 6
	.byte 0x78	# 7
	.byte 0x00	# 8
	.byte 0x10	# 9


.text
.global num2bits
num2bits:

	# copy the input number into r8
	mov r8,r4

	# start with all four displays blank
	movia r2,0x7F7F7F7F

	# initialize the shift amount to 0
	movi r9,0

	# load the divisor 10 into r15
	movi r15,10

num2bits_loop:
	# divide the number by 10 to get the quotient
	divu r10,r8,r15

	# multiply the quotient by 10
	mul r11,r10,r15

	# subtract to get the remainder
	sub r11,r8,r11

	# use the remainder to get the 7-segment bit pattern
	ldbu r13,Bits7seg(r11)

	# create a mask for the current digit
	movi r14,255
	sll r14,r14,r9
	nor r14,r14,r0

	# clear the current digit position
	and r2,r2,r14

	# shift the digit pattern into position
	sll r13,r13,r9

	# merge the digit pattern into the result
	or r2,r2,r13

	# update the number to the quotient
	mov r8,r10

	# move to the next digit position
	addi r9,r9,8

	# repeat until the quotient is 0
	bne r8,r0,num2bits_loop

	# return the final bit pattern
	ret