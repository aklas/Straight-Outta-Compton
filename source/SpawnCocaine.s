.section .text
.globl SpawnCocaine

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Spawns a Cocaine fuel item on the map, at one of three random locations
// Asks for a random number, compares the number with lane number
// 0 = left lane, 1 = middle lane, 2 = right lane

SpawnCocaine:

	push {r4, lr}
	
	RandomizeCocaine:
	
		bl generateRandomNum
		LDMFD sp!, {r0}
		
		cmp r0, #0
		ldreq r1, =288 

		cmp r0, #1
		ldreq r1, =480
		
		cmp r0, #2
		ldreq r1, =672
		
		mov r4, r1
		
		ldr r0, = POLICE
		mov r1, #1
		STMFD sp!, {r0, r1}
		bl getObjectElement
		LDMFD sp!, {r0}
		ldr r0, [r0]
		
		cmp r0, r4
		beq RandomizeCocaine
		
		mov r1, r4
		ldr r0, = COCAINE
		ldr r2, =0
		STMFD sp!, {r0, r1, r2}
		bl Move
	
	pop {r4, pc}
	
	

	
	
	
