.section .text
.globl DrawAt
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments[r0, r1, r2] --- > Return[]
// r0 = Pointer to Object
// r1 = x-coordinate value
// r2 = y-coordinate value

DrawAt:
	LDMFD sp!, {r0-r2}
	
	push {r4, r5, r6, r7, r8, lr}
	
	mov r4, r0
	mov r6, r1
	mov r7, r2
	
							// moving pointer of object
	mov r1, #0				// asking for image pointer
	STMFD sp!, {r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	mov r5, r0				// image in r5

	
	mov r0, r4				// moving pointer of object
	mov r1, #3				// asking for width pointer
	STMFD sp!, {r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r8, [r0]			// width in r8
	
	mov r0, r4				// moving pointer of object
	mov r1, #4				// asking for height pointer
	STMFD sp!, {r0,r1}
	bl getObjectElement
	LDMFD sp!, {r0}
	ldr r4, [r0]			// height in r4
	
	mov r0, r5				// pointer to object
	mov r1, r6				// x-cor
	mov r2, r7				// y-cor
	mov r3, r8				// width
	
	STMFD sp!, {r0-r4}
	bl DrawArray
	
	pop {r4, r5, r6, r7, r8, pc}
	
