.section .text
.globl Draw
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0] ---> Return []
// r0 = pointer to object


Draw:
	
	LDMFD sp!, {r0}
	push {r4, r5, r6, lr}
	
	
	mov r4, r0
	
	mov r1, #1				// asking for x_cor
	STMFD sp!, {r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r5, [r0]
	
	
	mov r0, r4				// moving pointer of object
	mov r1, #2				// asks for y_cor
	STMFD sp!, {r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r6, [r0]
	
	mov r0, r4				// store object pointer into r4
	mov r1, r5				// store x_cor in r1
	mov r2, r6				// store y_cor in r2
		
	STMFD sp!, {r0-r2}
	bl DrawAt
	
	pop {r4, r5, r6, pc}
