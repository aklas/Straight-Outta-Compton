.section .text
.globl DrawArray
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0, r1, r2, r3, r4] ---> Return[]
// r0 = pointer to Image Buffer
// r1 = x coordinates
// r2 = y coordinates
// r3 = x pixels (width)
// r4 = y pixels (height)
DrawArray:

		// KEEP IN MIND
		// R4 might not be saved, if any register other than r4 is used to pass arguments
		
		LDMFD sp!, {r0-r4}		// Taking all the arguments from the stack
		
		push { r4, r5, r6, r7, r8, r9, r10, lr} // Pusing the variable registers onto the stack

		
		// r0 = pointer to Image Buffer
		// r1 = x coordinates
		// r2 = y coordinates
		// r3 = x pixels (width)
		// r4 = y pixels (height)
		
		// r5 = offset
		// r6 = pointer to VBuffer
		// r7 = x counter
		// r8 = y counter
		// r9 = x Offset
		// r10= temporary storage
		
	DrawPixel_DArray:

		// gives registers variable names
		image	.req	r0
		xLoc	.req	r1
		yLoc	.req	r2
		xPixel	.req 	r3
		yPixel	.req	r4
		offset	.req	r5
		xoffset	.req 	r9
		
		// clears all other registers, just in case
		mov r5, #0
		mov r6, #0
		mov r7, #0
		mov r8, #0
		mov r9, #0
		
		
		rsb	xoffset, xPixel, #1024		// xoffset stores the offset from the current pixel line

		ldr	r6, =FrameBufferPointer		// r6 contains pointer to frame buffer
		ldr	r6, [r6]					// loading the frame buffer
		
		bal DrawAgain_DArray					// branches straight to drawing the first pixel


	UpdateY_DArray:					// Updating the row, to go to the next line

		// add yLoc, #1			// BUG, why cant I update the yLocation?
		add r8, #1				// Increments the row
		
		add xLoc, xoffset		// Adds the entire screen offset to the last pixed, effectively going to the next row
		mov r7, #0				// resets the column counter, aka width counter
		
		cmp r8, yPixel			// compares the row to maximum pixels, aka length
		beq exit_DArray				// if all pixels are written, exits the loop
	
		DrawAgain_DArray:
			
													// offset = (y * 1024) + x = x + (y << 10)
			add		offset,	xLoc, yLoc, lsl #10
			
													// offset *= 2 (for 16 bits per pixel = 2 bytes per pixel)
			lsl		offset, #1

			
			// load the specified image half word, increment the image pointer by 2 bytes
			ldrh	r10, [image], #2
			
			// store the colour (half word) at framebuffer pointer + offset

			
			strh	r10, [r6, offset]	// stores pixel value in specified framebuffer location
			
			add xLoc, #1	// incrementing the location pointer
			add r7, #1		// incrementing the width counter
			cmp r7, xPixel	// compares width counter with pixel width
			beq UpdateY_DArray		// if width is equal to the pixel, then update the length counter
			
			bal DrawAgain_DArray	// always loops back if counter is still less than the width

	exit_DArray:
		
		.unreq	offset
		.unreq	image	
		.unreq	xPixel	
		.unreq	yPixel	
		.unreq	xLoc	
		.unreq	yLoc
		.unreq	xoffset
		
		pop { r4, r5, r6, r7, r8, r9, r10, pc}
