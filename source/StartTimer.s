.section .text
.globl StartTimer


StartTimer:
	push {lr}
	
	ldr r0, =TIME
	ldr r1, [r0]
	
	ldr r3, =0x3F003004
	ldr r2, [r3]	
	
	add r1, r2, r1		
	
	str r1, [r0]
	
	pop {pc}
