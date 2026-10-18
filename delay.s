.text

# Part 1.3
.global delayNms
delayNms:
	# implement this ABI-compliant function

	#copy the register file into r2 -- so form r4 to r2
	mov r2, r4
	
	# check if n is 0
	beq r2, r0, delayNms_done
	
	# now we have to turn milliseconds into a loopcount
	
	#we have to load that constant into r8
	movia r8, 33333
	
	# use mul to multiply r2 by r8
	mul r2, r2, r8
	
	delayNms_loop:
	#Now we hve to make a delay loop
	#-subtract 1 from r2, check whether r2 is 0, if not 0 then back to the loop
	subi r2,r2,1
	bne r2,r0,delayNms_loop
	
	delayNms_done:
	# and now return the value:
	ret