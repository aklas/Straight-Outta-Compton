.globl     getObjectElement
    
.section .text

// Argument[r0, r1] ---> Return[r0]
// Argument[r0]: pointer to object
// Argument[r1]: desired element in array
// Return[r0]: pointer to desired array element
// *Argument[r1 = 0]: pointer to Image
// *Argument[r1 = 1]: pointer to X_cor
// *Argument[r1 = 2]: pointer to Y_cor
// *Argument[r1 = 3]: pointer to Width
// *Argument[r1 = 4]: pointer to Height
// *Argument[r1 = 5]: pointer to Replacement (if any)
getObjectElement:
	LDMFD sp!, {r0, r1}		// loading argument off the stack
	
	push {lr}			// saving lr(link register)
	lsl r1, r1, #2			// calculating offset (multiply by 4) 4 bytes = 1 word
	add r0, r0, r1			// adding offset to base address
	ldr r0, [r0]			// loading pointer to element in the array
	
	pop {lr}			// restoring lr(link register)
	STMFD sp!, {r0}			// loading argument(s) onto the stack
	mov pc, lr			// returning to calling code

