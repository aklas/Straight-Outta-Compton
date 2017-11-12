//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] ---> Return[r0]
//	r0 = SNES bitmask

	.section .text
	.globl SNES, Wait

SNES:

		push {r4, lr}
		
		// setting GPIO line 09 (latch) to output
		mov r0, #9
		mov r1, #0b001
		STMFD sp!, {r0,r1}
		bl Init_GPIO
		// setting GPIO line 10 (data) to input
		mov r0, #10
		mov r1, #0b000
		STMFD sp!, {r0, r1}
		bl Init_GPIO
		// setting GPIO line 11 (clock) to output
		mov r0, #11
		mov r1, #0b001
		STMFD sp!, {r0, r1}
		bl Init_GPIO
		
		bl Read_SNES			// get bit pattern from SNES controller
		LDMFD sp!, {r0}
		
		mov r4, r0
		
		ldr r1, =0x2000			// waits for 0x2000 microseconds
		STMFD sp!, {r1}
		bl Wait
		
		mov r0, r4
		
		pop {r4, lr}
		
		STMFD sp!, {r0}
	

		bx lr

	haltLoop$:
		b	haltLoop$
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments[r0, r1] ---> Return []
// r0: GPIO line number {09(LATCH), 10(DATA), 11(CLOCK)}
// r1: LSB 3 of r1 written to Clock line, {000, 001}
Init_GPIO:
	LDMFD sp!, {r0, r1}	// poping arguments of stack
	push {r4, r5, lr}	// preserving r4, r5, lr(link) register via pushing them onto stack
	
	// Line number = xy, xy = x*(10) + y*(1)
	// Ex: Line number = 09, then x = 0, y = 9
	calcLineNumAndOffset:
		// r0 (GPIO line number) is 09
			cmp r0, #9
			ldreq r2, =0x3F200000		// loading into r2 pointer to GPSEL0
			moveq r3, #9			// setting y = 9
			beq calcGPSELnOffset

		// r0 (GPIO line number) is either 10 or 11
			ldrne r2, =0x3F200004		// loading into r2 pointer to GPSEL1
			cmp r0, #10			// checking if GPIO line number is 10
			moveq r3, #0			// setting y = 0, since r0 = 10
			movne r3, #1			// setting y = 1, since r0 = 11
		
		// calculating correct offset
		calcGPSELnOffset:
			mov r4, #3			// offset per shift
			mul r3, r3, r4			// y*3 shifts

	// clear the corresponding bits in GPSELn
	// r2 contains pointer to GPSEL{0,1} register
	// r3 contains y*3
	clearGPSELnBits:
		mov r4, #0b111		// setting 3 LSB to 111 (binary)
		lsl r4, r3		// shifing 3 LSB (111) by offset
		ldr r5, [r2]		// loading GPSEL{0,1} register
		bic r5, r4		// clearing bits (y*3) to (y*3+2)

	// set the corresponding bits
	// r3 contain y*3
	// r5 contains GPSEL{0,1} register with bits cleared
	setBits:
		lsl r1, r3		// shifting 3 LSB of argument (r1) to correct offset
		orr r5, r5, r1		// setting the 3 LSB of argument into GPSEL{0,1} register

	// store back the modified GPSEL{0,1} register
	// r2 contain pointer to GPSEL{0,1}
	// r5 contain modified GPSEL{0,1} register
	storingGPSELnRegister:
		str r5, [r2]
	
	// pushing program counter back onto the stack and restoring r4, r5 register
	pop {r4, r5, pc}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments[r0] ---> Return []
// r0: LSB  is either {0,1}, value to write to LATCH (GPIO 09)
Write_Latch:
	LDMFD sp!, {r0}			// loading argument (r0) from the stack
	push {lr}			// preserving lr(link) register
	
	cmp r0, #0x0			// comparing to see if LSB is either 0 or 1
	
	ldreq r0, =0x3F200028		// if(r0 = 0) {r0 = GPCLR0}
	ldrne r0, =0x3F20001C		// else {r0 = GPSET0}
	
	ldr r2, [r0]			// loading GP{CLR0,SET0} memory mapped register from pointer (r0)
	
	mov r1, #1			// setting LSB(r1) to 1
	lsl r1, #9			// shift r1 left by 9 (9th pin): r1 = 0x200

	orr r3, r1, r2			// OR with original value to set 9th pin
	
	str r3, [r0]			// storing r3(modified value) back into memory mapped register GP{CLR0,SET0}

	pop {pc}			// popping lr(link) register and returning to calling code
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments[r0] ---> Return []
// r0: LSB  is either {0,1}, value to write to CLOCK (GPIO 11)
Write_Clock:
	LDMFD sp!, {r0}			// loads argument (r0) from the stack
	push {lr}			// preserving lr(link) register
	
	cmp r0, #0x0			// checking if LSB(r0) is 0 or 1
	
	ldreq r0, =0x3F200028		// if(r0 = 0) {r0 = GPCLR0}
	ldrne r0, =0x3F20001C		// else {r0 = GPSET0}
	
	ldr r2, [r0]			// loading GP{CLR0,SET0} memory mapped register from pointer (r0)
	
	mov r1, #1			// setting LSB(r1) to 1
	lsl r1, #11			// shift r1 left by 11 (11th pin): r1 = 0x800
	
	orr r3, r1, r2			// OR with original value to set 11th pin
	
	str r3, [r0]			// storing r3(modified value) back into memory mapped register GP{CLR0,SET0}
	
	pop {pc}			// popping lr(link) register and returning to calling code
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments[] ---> Return [r0]
// r0 = Value read from data line, {0,1}
Read_Data:
	push {lr}			// preserving lr(link) register

	ldr r0, =0x3F200034		// pointer to GPLEV0 into r0
	ldr r0, [r0]			// loading content of memory mapped register GPLEV0 into r0

	mov r1, #1			// LSB(r1) = 1
	lsl r1, #10			// shift r1 left by 10 (10th pin): r1 = 0x400
	
	tst r1, r0			// test if 10th bit (DATA) is either 1 or 0
	
	moveq r0, #0			// if(r0[10] = 0) {r0 = 0}
	movne r0, #1			// else {r0 = 1}	
	
	pop {lr}			// popping lr(link) register
	STMFD sp!, {r0}			// push result (value read, r0) onto the stack
	mov pc, lr			// returning to calling code
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0] ---> Return []
// r0: amount of time in micro-seconds
Wait:
	LDMFD sp!, {r0}			// loads argument (r0) from the stack
	push {lr}			// preserving lr(link) register
	
	ldr r3, =0x3F003004		// loading pointer to current time via CLO memory mapped register
	ldr r1, [r3]			// loading current time from pointer
	
	add r0, r1, r0			// r0 = current time (CLO) + (time to wait(argument, r0))
	
	// looping till the current time matches the offsetted time (time to wait till)
	keepWaiting:
		ldr r2, [r3]		// loading current time
		cmp r0, r2		// current time (CLO) == offsetted time?
		bgt keepWaiting		// if not loop back and check again
	
	pop {pc}			// returning to calling code
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] ---> Returns [r0]
// r0: 32 bit map from SNES controller regarding which buttons are pressed
Read_SNES:
	push {r8, r9, r10, lr}		// preserving r8, r9, r10, lr(link) register

	// write 1 to clock
	mov r9, #1
	STMFD sp!, {r9}
	bl Write_Clock
	
	// write 1 to latch
	mov r9, #1
	STMFD sp!, {r9}
	bl Write_Latch
	
	// waiting 12 microseconds for SNES to sample buttons
	mov r9, #12
	STMFD sp!, {r9}
	bl Wait
	
	// writing 0 to latch
	mov r9, #0
	STMFD sp!, {r9}
	bl Write_Latch
	
	// loop to read the output of SNES controller
	mov r8, #0	// r0 is the counter
	mov r10, #0	// r10 will be register to store SNES input
	readBitSnesLoop:
		// wait 6 microseconds
		mov r9, #6
		STMFD sp!, {r9}
		bl Wait
		// write 0 to clock
		mov r9, #0
		STMFD sp!, {r9}
		bl Write_Clock
		// wait 6 microseconds
		mov r9, #6
		STMFD sp!, {r9}
		bl Wait
		// read GPIO pin 10 (DATA), and saving bit into register r10
		bl Read_Data
		LDMFD sp!, {r9}
		lsl r10, r10, #1
		orr r10, r10, r9
		// write 1 to clock
		mov r9, #1
		STMFD sp!, {r9}
		bl Write_Clock
		
		// incrementing counter
		add r8, r8, #1
		
		// comparing to see if we have read all 16 bits
		cmp r8, #16
		blt readBitSnesLoop
	
	mov r0, r10		// saving the caluclated bit pattern
	pop {r8, r9, r10, lr}	// restoring preserved registers
	STMFD sp!, {r0}		// pushing result (bit pattern from SNES) onto the stack
	mov pc, lr		// returning to calling code
