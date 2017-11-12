.section .text
.globl ResetGame


ResetGame:

	push {lr}
	
	ldr r0, =FINISH			// Clearing the finish Line Flag, so it resets to the top
	ldr r1, =6
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	mov r1, #0
	str r1, [r0]
	
	ldr r0, =FINISH
	ldr r1, =2
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r1, =0
	str r1, [r0]
	
	ldr r0, =TIME			// Resetting the time for the next Game
	ldr r1, =0x1C9C380
	str r1, [r0]
	
	ldr r0, =LIFE
	ldr r1, =6				// RESET Lives
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	
	ldr r1, =3
	str r1, [r0]
	
	ldr r0, =COCAINETANK 	//	RESET Fuel
	ldr r1, =6
	STMFD sp!,{r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}	
	
	ldr r1, =100
	str r1, [r0]
	
	bl DisplayLives
	bl DisplayFuel
	
	pop {pc}
