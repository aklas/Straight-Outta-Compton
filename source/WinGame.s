.section .text
.globl WinGame
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] --> Return []
// 
// Task:
// Show the winning image on screen, and go to main menu after any button press.

WinGame:
	
	ldr r0, = PASSED	
	STMFD sp!,{r0}		
	bl Draw
	
	
	bl SNES					// Checks SNES input
	LDMFD sp!, {r0}
	
	ldr r1, =0xFFFF
	cmp r0, r1
	beq WinGame
	
	bal Transition	
	
	// No need to push or pop lr/pc, as we dont need to go back

