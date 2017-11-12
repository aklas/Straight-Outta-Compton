.section .text
.globl DecrementFuel
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] --> Return []
// 
// Task:
// Decrement the fuel by 1, and display the new fuel on screen.

DecrementFuel:
	
	push {r4, lr}
	
	
	ldr r0, =COCAINETANK 	//	CONTAINS POINTER TO OBJECT ARRAY
	ldr r1, =6
	STMFD sp!,{r0,r1}		//	LOADING r0 AND r1 ONTO STACK
	bl getObjectElement		//	BRANCH TO getObjectElement FUNCTION
	LDMFD sp!, {r0}	
	ldr r4, [r0]
	
	
	sub r4, #1
	
	str r4, [r0]
	
	bl DisplayFuel
	
	cmp r4, #0
	beq LoseGame

	pop {r4, pc}
