.section .text
.globl SpawnPig

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Spawns a police car on the map, at one of three random locations
// Asks for a random number, compares the number with lane number
// 0 = left lane, 1 = middle lane, 2 = right lane

SpawnPig:

	push {lr}
	
	bl generateRandomNum
	LDMFD sp!, {r0}
	
	cmp r0, #0
	ldreq r1, =288 

	cmp r0, #1
	ldreq r1, =480
	
	cmp r0, #2
	ldreq r1, =672

	ldr r0, = POLICE
	ldr r2, =0
	STMFD sp!, {r0, r1, r2}
	bl Move
	
	pop {pc}
	
	

	
	
	
