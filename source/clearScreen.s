.section .text
.globl clearScreen



clearScreen:
	
	mov		r0, #0
	mov		r1, #0
	ldr		r2,	=0x0000
	b		DrawPixels



/* Draw Pixel
 *  r0 - x
 *  r1 - y
 *  r2 - color
 */

DrawPixels:

	push {r4-r7, lr}


	offset	.req	r4
	
	mov r5, #768		// y
	mov r6, #1024		// x
	
	ldr	r3, =FrameBufferPointer
	ldr	r3, [r3]
	
	bal DrawAgains
	

	
	
Updateit:

	add r1, #1
	mov r0, #0
	
	cmp r1, r5
	beq goBack
	
DrawAgains:
	
	// offset = (y * 1024) + x = x + (y << 10)
	add		offset,	r0, r1, lsl #10
	
	// offset *= 2 (for 16 bits per pixel = 2 bytes per pixel)
	lsl		offset, #1

	// store the colour (half word) at framebuffer pointer + offset

	
	strh	r2, [r3, offset]
	
	add r0, #1
	cmp r0, r6
	beq Updateit
	
	bal DrawAgains

goBack:

	pop {r4-r7, pc}
	
