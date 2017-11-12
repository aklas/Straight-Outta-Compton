.section .text
.globl DecrementLives


//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] -- > Return []
// 
// Task:
// Decrements the lives by 1, and then prints them.


DecrementLives:

	push {lr}
	
	ldr r0, =LIFE
	ldr r1, =6				// ask for the value of lives left
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	
	ldr r1, [r0]
	
	sub r1, #1
	
	str r1, [r0]
	
	bl DisplayLives
	
	pop {pc}
