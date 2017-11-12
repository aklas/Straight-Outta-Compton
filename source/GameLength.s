.section .text
.globl GameLength

GameLength:

	push {lr}
	
	ldr r0, =TIME
	ldr r1, [r0]
	
	ldr r3, =0x3F003004		// loading pointer to current time via CLO memory mapped register
	ldr r2, [r3]			// loading current time from pointer
	
	
	cmp r1, r2		// current time (CLO) == offsetted time?
	bgt TimeLeft
	
	
	
	bl SpawnFinishLine
	
	pop {pc}
	
	TimeLeft:		// if not loop back and check again
	
	pop {pc}			// returning to calling code
