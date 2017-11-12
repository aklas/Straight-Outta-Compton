.section .text
.globl Filler

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [r0, r1, r2] ---> Return[]
//	r0 = pointer to Object being filled 
//	r1 = x_cor initial
//	r2 = y_cor initial

Filler:
	
	LDMFD sp!, {r0, r1, r2}
	
	push {r4, r5, r6, r7, r8, r9, lr}
	


	mov r4, r0
	mov r5, r1					// r5 = x_cor
	mov r6, r2					// r6 = y _cor
	
	mov r1, #5					// asking for the replacement object's pointer
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	mov r7, r0					// r7 stores pointer to object
	
	mov r0, r4					// moving object pointer back into r0
	mov r1, #3					// asking for the replacement object's pointer
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r8, [r0]				// r8 stores width
	
	mov r0, r4					// moving object pointer back into r0
	mov r1, #4					// asking for the replacement object's pointer
	STMFD sp!, {r0, r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r9, [r0]				// r9 stores height
	
	
	mov r0, r7
	mov r1, r5
	mov r2, r6
	add r3, r5, r8
	add r4, r6, r9
	STMFD sp!, {r0, r1, r2, r3, r4}
	bl Paint
	
	
	
	pop {r4, r5, r6, r7, r8, r9, pc}
