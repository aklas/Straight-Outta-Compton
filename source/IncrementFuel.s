.section .text
.globl IncrementFuel
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] --> Return []
// 
// Task:
// Increment the fuel by 10, and display the new fuel on screen.

IncrementFuel:
	
	push {lr}
	
	
	ldr r0, =COCAINETANK 	//	CONTAINS POINTER TO OBJECT ARRAY
	ldr r1, =6
	STMFD sp!,{r0,r1}		//	LOADING r0 AND r1 ONTO STACK
	bl getObjectElement		//	BRANCH TO getObjectElement FUNCTION
	LDMFD sp!, {r0}	
	ldr r1, [r0]
	
	
	add r1, #10
	
	str r1, [r0]
	
	bl DisplayFuel
	

	pop {pc}
