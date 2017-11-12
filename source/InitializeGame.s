.section .text
.globl InitializeGame

InitializeGame:

	push {lr}

	ldr r0, =GRASS
	mov r1, #0
	mov r2, #32
	ldr r3, =192
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	ldr r0, =GRASS
	mov r1, #832
	mov r2, #32
	ldr r3, =1024
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	ldr r0, =ROAD
	mov r1, #192
	mov r2, #0
	ldr r3, =832
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	ldr r0, =WALL
	mov r1, #192
	mov r2, #0
	ldr r3, =224
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	ldr r0, =WALL
	mov r1, #800
	mov r2, #0
	ldr r3, =832
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	ldr r0, =MEDIAN
	mov r1, #384
	mov r2, #0
	ldr r3, =416
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint
	
	
	ldr r0, =MEDIAN
	mov r1, #608
	mov r2, #0
	ldr r3, =640
	ldr r4, =768
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint

	
	ldr r0, = CAR
	ldr r1, = 480
	ldr r2, = 668
	STMFD sp!, {r0, r1, r2}
	bl Move
	
	
	pop {pc}
