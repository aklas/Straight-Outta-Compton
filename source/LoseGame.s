.section .text
.globl LoseGame
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] --> Return []
// 
// Task:
// Show the Busted image on the screen, and go to main menu, after any button press.

LoseGame:

	
	ldr r0, = BUSTED	
	STMFD sp!,{r0}		
	bl Draw
	
	bl SNES					// Checks SNES input
	LDMFD sp!, {r0}
	
	ldr r1, =0xFFFF
	cmp r0, r1
	beq LoseGame
	
	bal Transition
	
	// No need to push or pop lr/pc, as we dont need to go back
