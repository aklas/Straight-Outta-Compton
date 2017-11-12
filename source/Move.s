.section .text
.globl Move
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0, r1, r2] ---> Return[]
//	r0 = pointer to Object being shifted 
//	r1 = x_cor new
//	r2 = y_cor new



Move:
	
	LDMFD sp!, {r0, r1, r2}
	
	push { r4, r5, r6, r7, r8, r9, r10, lr}
	
	mov r4, r0					// pointer to object
	mov r5, r1					// new x_cor
	mov r6, r2					// new y_cor
	
	mov r1, #1
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	mov r7, r0					// r7 has the pointer to x_cor
	ldr r9, [r7]				// r9 has the value of x_cor
	
	mov r0, r4
	mov r1, #2
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	mov r8, r0					// r8 has the pointer to y_cor
	ldr r10, [r8]

	
	mov r0, r4
	mov r1, r9					// r9 = x_cor (old)
	mov r2, r10					// r10 = y_cor (old)
	STMFD sp!, {r0, r1, r2}
	bl Filler
	
	mov r0, r4
	mov r1, r5
	mov r2, r6
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	
	
	str r5, [r7]
	str r6, [r8]
	
	pop {r4, r5, r6, r7, r8, r9, r10, pc}
