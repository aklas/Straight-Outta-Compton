.section .text
.globl SpawnFinishLine

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Spawns the Finish Line at default position


SpawnFinishLine:

	push {lr}
	
	
	ldr r0, =FINISH
	ldr r1, =6
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	
	ldr r1, [r0]
	cmp r1, #1
	bleq MoveFinishLine
	popeq {pc}
	
	
	
	
	mov r1, #1
	str r1, [r0]
	
	ldr r0, =FINISH
	ldr r1, =2
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	
	ldr r1, =0
	str r1, [r0]
	
	ldr r0, = FINISH
	STMFD sp!, {r0}
	bl Draw
	
	pop {pc}
