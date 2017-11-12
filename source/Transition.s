.section .text
.globl Transition
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Arguments [] ---> Return[]
/*
*	Task: Control the entire game environment, using input from the snes.
*	Game stays here for the majority of it's time. Calls upon different functions.
*
*/


Transition:

	push {r4, lr}

	show_MainMenu:				// Paints the MainMenu to screen
	
	bl MainMenu
	LDMFD sp!, {r4}
	
	cmp r4, #0
	bleq clearScreen		
	beq hang
	
	reset_Game:
	
	bl InitializeGame
	
	
	waitforA_Transition:
		
		bl SNES
		bl DecipherSNES
		LDMFD sp!, {r0}
		
		cmp r0, #0x80			// A gives the green light to start game
		beq Green_Light 
		
		b waitforA_Transition
		
	Green_Light:
		
		bl ResetGame
		bl SpawnPig
		bl SpawnCocaine
		bl StartTimer
		
	Start_Game:					// Game starts moving, all objects are initialized.
	
		bl sideLoop				// Moves the bushes
		bl MovePig				// Moves the random cop car
		bl MoveCocaine
		bl DecrementFuel
		bl CheckCollision
		bl GameLength
		
		bl SNES					// Checks SNES input
		bl DecipherSNES			// Checks which buttons are pressed
		LDMFD sp!, {r0}
		
		cmp r0, #0x100			// Right
		bleq Right_Transition
		beq Start_Game
		
		cmp r0, #0x200			// Left
		bleq Left_Transition
		beq Start_Game
		
		cmp r0, #0x1000			// Start
		beq Start_Transition
		
		cmp r0, #0x2000			// Select
		beq Select_Transition
		
		b Start_Game
	
	Start_Transition:
	
		b reset_Game
	
	Select_Transition:

		b show_MainMenu
	
	pop {r4, pc}
	
