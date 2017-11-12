.globl Right_Transition
.section .text


/*
*	Task: 
*	Move vehicle to the right, check for collision.
*	If Collision, Respawn vehicle in the middle of map, 
*	Remove 1 Life AND 10 Fuel Items
*/



Right_Transition:
	
	push {r4, r5, lr}
	
	ldr r0, = CAR				// Asking for vehicle's previous x-cor
	ldr r1, = 1
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r4}
	ldr r4, [r4]
	
	ldr r0, = CAR				// Asking for vehicle's previous y-cor 
	ldr r1, = 2
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r5}
	ldr r2, [r5]
	
	ldr r0, = CAR
	add r1, r4, #192
	
	cmp r1, #800				// If it hits wall, detect collision
	bge Collision
	
	STMFD sp!, {r0, r1, r2}
	bl Move
		
	pop {r4, r5, pc}

	Collision:					// Collision respawns car in the middle
		
		
		bl DecrementLives
		
		ldr r0, = CAR
		ldr r1, = 480
		ldr r2, = 668
		STMFD sp!, {r0, r1, r2}
		bl Move
	
	pop {r4, r5, pc}
