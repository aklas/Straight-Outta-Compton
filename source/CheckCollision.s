.section .text
.globl CheckCollision


CheckCollision:

	push {lr}
	
	bl collisionDetection
	LDMFD sp!, {r0}
	
	cmp r0, #0				// No Collision
	popeq {pc}
	
	cmp r0, #1				// Collision with Police
	beq hit_Police
	
	cmp r0, #2				// Collision with Cocaine (Fuel)
	beq hit_Fuel
	
	cmp r0, #3
	beq hit_Finish
	
	pop {pc}
	
	
	hit_Police:
		
		ldr r0, =COCAINETANK 	//	Decrements 9 fuel points
		ldr r1, =6
		STMFD sp!,{r0,r1}
		bl getObjectElement	
		LDMFD sp!, {r0}	
		ldr r1, [r0]
		sub r1, #9
		str r1, [r0]
		
		ldr r0, =BLACK190X32
		STMFD sp!, {r0}
		bl Draw
		
		ldr r0, =DUMB
		STMFD sp!, {r0}
		bl Draw
		
		bl DecrementFuel
		bl SpawnPig
		pop {pc}
	
	
	hit_Fuel:
	
		ldr r0, =BLACK190X32
		STMFD sp!, {r0}
		bl Draw
		
		ldr r0, =SMART
		STMFD sp!, {r0}
		bl Draw
		
		bl IncrementFuel
		bl SpawnCocaine
		pop {pc}
	
	hit_Finish:
		
		bal WinGame
