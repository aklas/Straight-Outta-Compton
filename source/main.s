.section    .init
.globl     _start, hang

_start:
    b       main
    
.section .text

main:
    mov     sp, #0x8000
	
	bl		EnableJTAG

	bl		InitFrameBuffer
	
	
	
	bl Transition

	
	
/*
	
	// Checking SNES Controller
	nop
	bl SNES
	LDMFD sp!, {r0}

*/	
	
/*
	// Check move
	ldr r0, = POLICE
	mov r1, #20
	mov r2, #300
	STMFD sp!, {r0, r1, r2}
	bl Move

	
	ldr r0, = POLICE
	mov r1, #200
	mov r2, #300
	STMFD sp!, {r0, r1, r2}
	bl Move
	
	ldr r0, = POLICE
	mov r1, #230
	mov r2, #300
	STMFD sp!, {r0, r1, r2}
	bl Move
*/
/*
	// check Draw
	
	ldr r0, = GRASS
	
	STMFD sp!, {r0}
	bl Draw
	
	ldr r0, = CAR
	
	STMFD sp!, {r0}
	bl Draw
	
	ldr r0, = ROAD
	
	STMFD sp!, {r0}
	bl Draw
	
	ldr r0, = WALL
	
	STMFD sp!, {r0}
	bl Draw

*/

/*
	//check DrawAt
	
	ldr r0, = CAR
	
	mov r1, #0
	mov r2, #0

	
	STMFD sp!, {r0-r4}
	bl DrawAt
	
*/
	
/*
	
	// Check DrawArray
	mov r5, #0
	mov r6, #0
	

	keepDrawing:
	
	cmp r5, #768
	beq	main
	
	cmp		r6, #1024
	moveq	r6, #0
	addeq	r5, #32
	
	ldr		r0, =WALL
	ldr		r0, [r0]
	mov		r1, r6
	mov		r2, r5
	ldr 	r3, =32	
	ldr 	r4, =32	
	
	
	STMFD sp!, {r0-r4}
	bl DrawArray
	
	add r6, #32
	
	bal keepDrawing
*/

hang:
	b		hang


.section .data


