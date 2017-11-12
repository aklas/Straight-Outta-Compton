.section .text
.globl DisplayFuel
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] --> Return []
// 
// Task:
// Display fuel on the screen, Fuel is stored as a global variable.

DisplayFuel:

	push {r4, r5, r6, r7, r8, lr}
	
	ldr r0, =COCAINETANK
	STMFD sp!,{r0}
	bl Draw
	
	ldr r0, =BLACK
	ldr r1, =32
	ldr r2, =0
	STMFD sp!, {r0, r1, r2}
	bl DrawAt

	ldr r0, =BLACK
	ldr r1, =64
	ldr r2, =0
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	
	ldr r0, =COCAINETANK 	//	go to cocainetank Object
	ldr r1, =6
	STMFD sp!,{r0,r1}		//	retrieve the current fuel variable
	bl getObjectElement		//	
	LDMFD sp!, {r0}	
	ldr r0, [r0]
	
	ldr r5, =10
	mov r7, r0
	
	sdiv r4, r0, r5  		// r4 = r0 / r5
	mls  r6, r5, r4, r0		//  r6 = r0 - (r5 * r4)

	mov r1, r6

	ldr r0, =numImageArray 	//	CONTAINS POINTER TO OBJECT ARRAY
	STMFD sp!,{r0,r1}		//	LOADING r0 AND r1 ONTO STACK
	bl getObjectElement		//	BRANCH TO getObjectElement FUNCTION
	LDMFD sp!, {r0}			//	CONTAINS POINTER TO IMAGE OF NUMBER PROVIDED BY USER
	
	
	ldr r1, =75				//	X COORDINATE
	ldr r2, =0		    	//	Y COORDINATE
	STMFD sp!, {r0, r1, r2} //	STORING REGISTERS ONTO STACK FOR USE IN MOVE FUNCTION
	bl DrawAt
	
	
	sdiv r7, r7, r5
	mov r0, r7
	
	sdiv r4, r0, r5  		//	r4 = r0 / r5
	mls  r6, r5, r4, r0		//  r6 = r0 - (r5 * r4)
	
	mov r1, r6

	ldr r0, =numImageArray 	//	CONTAINS POINTER TO OBJECT ARRAY
	STMFD sp!,{r0,r1}		//	LOADING r0 AND r1 ONTO STACK
	bl getObjectElement		//	BRANCH TO getObjectElement FUNCTION
	LDMFD sp!, {r0}			//	CONTAINS POINTER TO IMAGE OF NUMBER PROVIDED BY USER
	
	
	ldr r1, =55				// X COORDINATE
	ldr r2, =0		    	// Y COORDINATE
	STMFD sp!, {r0, r1, r2} // STORING REGISTERS ONTO STACK FOR USE IN MOVE FUNCTION
	bl DrawAt
	
	sdiv r7, r7, r5
	mov r0, r7
	
	sdiv r4, r0, r5  		//	r4 = r0 / r5
	mls  r6, r5, r4, r0		//	r6 = r0 - (r5 * r4)
	
	mov r1, r6

	ldr r0, =numImageArray	//	CONTAINS POINTER TO OBJECT ARRAY
	STMFD sp!,{r0,r1}		//	LOADING r0 AND r1 ONTO STACK
	bl getObjectElement		//	BRANCH TO getObjectElement FUNCTION
	LDMFD sp!, {r0}			//	CONTAINS POINTER TO IMAGE OF NUMBER PROVIDED BY USER
	
	
	ldr r1, =35				//	X COORDINATE
	ldr r2, =0		    	//	Y COORDINATE
	STMFD sp!, {r0, r1, r2} //	STORING REGISTERS ONTO STACK FOR USE IN MOVE FUNCTION
	bl DrawAt
	
	
	pop {r4,r5,r6, r7, r8, lr}		
	mov pc, lr				//	RETURNING TO CALLING CODE
	
.section  .data

.align
numImageArray:
	.word ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE
	
	
	
	
