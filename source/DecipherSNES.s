//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0] ---> Return[r0]
// Input r0 = SNES button pattern
// Output r0 = Button pressed
// Task:
// Take SNES input, and return the bitmask for the button pressed.

/*
	// get Snes register
	// Check if it is one of the 4 buttons
	// if it is, return the button mask
	// if button not pressed, or different button pressed
	// don't return anything (0)

	
	public int DecipherSNES (int SNESRegister)
	{
		int A 		= 0x80;
		inb Right 	= 0x100;
		int Left 	= 0x200;
		int Start	= 0x1000;
		int Select 	= 0x2000;
		
		if (SNESRegister && A == A)
			{return A}
		else if (SNESRegister && Right == Right)
			{return Right;}
		else if (SNESRegister && Left == Left)
			{return Left;}
		else if (SNESRegister && Start == Start)
			{return Start;}
		else if (SNESRegister && Select == Select)
			{return Select;}
		else {return 0;}
	}
*/

.section .text
.globl DecipherSNES

DecipherSNES:

	LDMFD sp!, {r0}
	
	push {r4, r5, r6, r7, r8, lr}
	
	ldr r4, =0x80					// A
	ldr r5, =0x100					// RIGHT
	ldr r6, =0x200					// LEFT
	ldr r7, =0x1000					// START
	ldr r8, =0x2000					// SELECT
	
	tst r0, r4						// If A is pressed, return A mask
	moveq r0, r4
	beq DoneReading
	
	tst r0, r5						// If Right is pressed, return Right mask
	moveq r0, r5
	beq DoneReading
	
	tst r0, r6						// If Left is pressed, return Left mask
	moveq r0, r6
	beq DoneReading
	
	tst r0, r7						// If Start is pressed, return Start mask
	moveq r0, r7
	beq DoneReading

	tst r0, r8						// If Select is pressed, return Select mask
	moveq r0, r8
	beq DoneReading

	DoneReading:

		pop {r4, r5, r6, r7, r8, lr}
		STMFD sp!, {r0}
	
	bx lr
