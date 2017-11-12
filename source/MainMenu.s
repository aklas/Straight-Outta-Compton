//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] ---> Return[r0]
// r0 = 0 QUIT
// r0 = 1 START

/*
*	Task: 
*	Display the main menu, move the selector when required, select the correct option.
*	Return the value of which ever option is chosen.
*	0 when user Quits
*	1 when user Starts
*
*/
.section .text
.globl MainMenu

MainMenu:

	push {r4, lr}
	
	bl		clearScreen
	
	mov r4, #1					// We use r4 as the internal, Selector flag
								// Mov 1 into r4, as the selector is on Start
	
	ldr r0, =INTRO				
	STMFD sp!, {r0}				// Draw the Game title
	bl Draw
	
	ldr r0, =CREATORS
	STMFD sp!, {r0}				// Draw the CREATOR title
	bl Draw
	
	
	ldr r0, = SELECTOR			// Draw the Selector (Eazy E head)
	ldr r1, =260
	ldr r2, =540
	STMFD sp!, {r0, r1, r2}
	bl DrawAt
	

	KeepReading_MainMenu:		// This loop keeps repeating, checks for the input from SNES

		bl SNES
		bl DecipherSNES
		LDMFD sp!, {r0}
		
		cmp r0, #0x80			// A
		beq A_MainMenu
		
		cmp r0, #0x100			// Right
		beq Right_MainMenu
		
		cmp r0, #0x200			// Left
		beq Left_MainMenu
		
		b KeepReading_MainMenu	// Always branches to top, if no correct values	
	

	
	Left_MainMenu:				// Pressing left lands selector on Start

		ldr r0, = SELECTOR		
		ldr r1, =260
		ldr r2, =540
		STMFD sp!, {r0, r1, r2}
		bl Move
		
		mov r4, #1				// Flag is set to 1, aka Start flag
		
		b KeepReading_MainMenu	// Goes back to top, waits for A
	
	Right_MainMenu:				// Pressing left lands selector on Quit

		ldr r0, = SELECTOR
		ldr r1, =635
		ldr r2, =540
		STMFD sp!, {r0, r1, r2}
		bl Move
		
		mov r4, #0				// Flag is set to 0, aka Quit flag
		
		b KeepReading_MainMenu	// Goes back to top, waits for A
	
	A_MainMenu:					// When A is pressed

		cmp r4, #1				// If the flag is 1, it will start game
		beq Start_Mainmenu
		
	
	Quit_Mainmenu:				// Otherwise, it will quit game
		
		mov r0, r4				// Returning 0 means quit game
		pop {r4, lr}
		STMFD sp!, {r0}
	
	mov pc, lr
	
	Start_Mainmenu:

		mov r0, r4				// Returning 1 means Start Game 
		pop {r4, lr}
		STMFD sp!, {r0}
	
	mov pc, lr
