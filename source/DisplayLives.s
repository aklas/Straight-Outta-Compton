.section .text
.globl DisplayLives

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] -- > Return []
// 
// Task:
// Lives are stored as a global variable in the buffer.


DisplayLives:

	push {r4, lr}
	
	ldr r0, =BLACK			// Cleaning the background for all three lives
	mov r1, #96				// TEST WITH PAINT FUNCTION, once game is up and running
	mov r2, #0
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	
	ldr r0, =BLACK
	mov r1, #128
	mov r2, #0
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	
	ldr r0, =BLACK
	mov r1, #160
	mov r2, #0
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	
	ldr r4, =LIFE			// load the pointer to LIFE, it will be used a lot
	
	mov r0, r4
	ldr r1, =6				// ask for the value of lives left
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	
	ldr r0, [r0]			// load the value into r0
	
	cmp r0, #0				// if life is 0, end game
	beq LoseGame
	
	cmp r0, #1				// otherwise, continue to display the amount of lives
	beq OneLife	
	
	cmp r0, #2
	beq TwoLives
	
	mov r0, r4
	ldr r1, =160			// third life is displayed at x=160
	ldr r2, =0				
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	

	TwoLives:
	
		
		ldr r1, =128
		ldr r2, =0
		mov r0, r4
		STMFD sp!, {r0, r1, r2}
		bl DrawAt
	
	OneLife:
	
		ldr r1, =96
		ldr r2, =0
		mov r0, r4
		STMFD sp!, {r0, r1, r2}
		bl DrawAt
	
	
	pop {r4, pc}
	
