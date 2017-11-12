.globl     Paint
.section .text

//---------------------------------------------------------------------------------------------------------------------	
	// fill the grass(6 tiles horizontally by 24 tiles vertically) on left and right side
/*
		// draw left side grass
		for(i = 0; i < 6; j++){
			for(j = 0; j < 24; j++){
				int x = i * 32;
				int y = j *32;
				drawAt(grass, i, j)
			}
		}


		// drawing right grass
		for(i = 26; i < 32; j++){
			for(j = 0; j < 24; j++){
				int x = i * 32;
				int y = j *32;
				drawAt(grass, i, j)
			}
		}
*/
/*
setUpBackGround:
		colOffset .req r5
		leftORright .req r6
		maxCol .req r7
		maxRow .req r8
		row_i .req r9
		col_j .req r10

		mov maxCol, #6
		mov maxRow, #24
		mov row_i, #0
		mov leftORright, #0
		mov colOffset, #0
setUpBackGroundGrass:
		setUpBackGround_For1:
			cmp row_i, maxRow
			bge setUpBackGround_For1_EXIT
			// outter loop stuff

			mov col_j, r5
			setUpBackGround_For2:
				cmp col_j, maxCol
				bge setUpBackGround_For2_EXIT
				
				// inner loop stuff
				// multiply x and y by 32 = 2^(5)
				ldr r2, =GRASS
				lsl r3, col_j, #5
				lsl r4, row_i, #5
				
				STMFD sp!, {r2, r3, r4}
				
				bl DrawAt
				
				add col_j, #1
				bal setUpBackGround_For2
			setUpBackGround_For2_EXIT:

			add row_i, #1
			bal setUpBackGround_For1
		setUpBackGround_For1_EXIT:
		cmp leftORright, #0
		bne setUpBackGroundGrassEXIT
		mov leftORright, #1
		mov maxCol, #32
		mov row_i, #0
		mov col_j, #26
		mov colOffset, #26
		bal setUpBackGroundGrass
setUpBackGroundGrassEXIT:

*/

// Arguments[r0, r1, r2, r3, r4] ---> Return[]
// Argument[r0]: pointer to object
// Argument[r1]: x cordinate of top left point
// Argument[r2]: y cordinate of top left point
// Argument[r3]: x cordinate of bottom right point
// Argument[r4]: y cordinate of bottom right point
	// assume the structure given...
	Object .req r4	// first argument
	TL_y .req r5	// second argument
	TL_x .req r6	// third argument
	BR_y .req r7	// fourth argument
	BR_x .req r8	// fifth argument
	i_row .req r9
	j_col .req r10


Paint:
	LDMFD sp!, {r0, r1, r2}
	ldr r3, =PaintWIDTH
	str r0, [r3]
	ldr r3, =PaintHEIGHT
	str r1, [r3]

	LDMFD sp!, {r0, r1}
	push {r4, r5, r6, r7, r8, r9, r10, lr}

	mov r3, r0
	mov r4, r1

	ldr r5, =PaintWIDTH
	ldr r0, [r5]
	ldr r5, =PaintHEIGHT
	ldr r1, [r5]

	mov r8, r4
	mov r7, r3
	mov r6, r2
	mov r5, r1
	mov r4, r0

	add r10, #10
breakEver:
	add r10, #10
	add r10, #10

	// load the width and height into memory.... below into the .data section
	mov i_row, TL_y
	Paint_For1:
		cmp i_row, BR_y
		bge Paint_For1_EXIT
		// outter loop stuff
		mov j_col, TL_x
		Paint_For2:
			cmp j_col, BR_x
			bge Paint_For2_EXIT
			
			// inner loop stuff
			STMFD sp!, {Object, j_col, i_row}
			bl DrawAt
			// loading into r1 the width of Object
			
			mov r0, Object
			mov r1, #3
			STMFD sp!, {r0, r1}
			bl getObjectElement
			LDMFD sp!, {r0}
			ldr r0, [r0]
			//ldr r1, =PaintWIDTH
			//str r0, [r1]



			add j_col, j_col, r0
			bal Paint_For2
		Paint_For2_EXIT:
		// loading into r2 the height of Object

		mov r0, Object
		mov r1, #4
		STMFD sp!, {r0, r1}
		bl getObjectElement
		LDMFD sp!, {r0}
		ldr r0, [r0]
		//ldr r1, =PaintHEIGHT
		//str r0, [r1]

		add i_row, i_row, r0
		bal Paint_For1
	Paint_For1_EXIT:
	

	pop {r4, r5, r6, r7, r8, r9, r10, pc}
// for(i_row = TL_y; i_row < BR_y; i_row = i_row + Object.H){
// 	for(j_col = TL_x; j_col < BR_x; j_col = j_col + Object.W){
// 		drawAt(Object, i_row, j_col);
// 	}
// }
hang:
	b		hang


.section .data

PaintWIDTH:
	.int 0
PaintHEIGHT:
	.int 0

/*
	LDMFD sp!, {r0, r1, r2, r3}
	// compute delta_X (x of bottom right - x of top left)
	sub r1, r3, r1
	// loading y cordinate of bottom right point into r3
	LFMFD sp!, {r3}
	// compute delta_Y (y of bottom right - y of top left)
	sub r2, r3, r2
	// r1 = delta_X
	// r2 = delta_Y
	push {r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r2

	delta_Y .req r4
	delta_X .req r5
	row_i .req r6
	col_j .req r7
*/
