.globl Left_Transition
.section .text


/*
*	Task: 
*	Move vehicle to the left, check for collision.
*	If Collision, Respawn vehicle in the middle of map, 
*	Remove 1 Life AND 10 Fuel Items
*/



Left_Transition:
	
	push {r4, r5, lr}
	
	ldr r0, = CAR			// Asking for vehicle's previous x-cor
	ldr r1, = 1
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r4}
	ldr r4, [r4]
	
	ldr r0, = CAR			// Asking for vehicle's previous y-cor
	ldr r1, = 2
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r5}
	ldr r2, [r5]
	
	ldr r0, = CAR
	sub r1, r4, #192
	
	cmp r1, #192			// If it hits wall, detect collision
	ble Collision
	
	STMFD sp!, {r0, r1, r2}
	bl Move
	
	
	pop {r4, r5, pc}

	Collision:				// Collision respawns car in the middle
							// Decrements Fuel and life (Planned)
	
		bl DecrementLives
		
		ldr r0, = CAR
		ldr r1, = 480
		ldr r2, = 668
		STMFD sp!, {r0, r1, r2}
		bl Move
	
	pop {r4, r5, pc}
