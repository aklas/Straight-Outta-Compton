.globl paintArray, fillArray, updateArray

// create a data structure to represent state of the side elements (tree, shrubs, etc...)

// paint to the screen the current state of the data structure of the side elements
// Arguments[r0, r1] ---> Return[]
// Argument[r0]: pointer to array
// Argument[r1]: number of elements in array
paintArray:
	LDMFD sp!, {r0, r1}
	push {r8, r9, r10, lr}
	
	// loop over array the number of elements given in r1
	// for(int i = 0; i < arrayLength; i++){
	//	image = load[i]
	//	x_cor = load[i++]
	//	y_cor = load[i++]
		
	//	drawAt(image, x_cor, y_cor)
	// }
	
	// r8 = counter
	// r9 = arrayLength
	// r10 = array
	counter		.req r10
	array		.req r9
	arrayLength 	.req r8
	
	mov arrayLength, r1
	mov array, r0
	mov r1, #3
	mul arrayLength, arrayLength, r1
	mov counter, #0
	for_paintArray:
		cmp counter, arrayLength
		bge for_paintArrayEND
		
		//	image = array[i]
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r4}
		//	x_cor = load[i++]
		add counter, #1
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r5}
		//	y_cor = load[i++]
		add counter, #1
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r6}
		
		STMFD sp!, {r4, r5, r6}
		bl DrawAt

		add counter, #1
		bal for_paintArray
	for_paintArrayEND:

	.unreq counter
	.unreq array
	.unreq arrayLength
	pop {r8, r9, r10, pc}




// paint to the screen the current state of the data structure of the side elements
// Arguments[r0, r1] ---> Return[]
// Argument[r0]: pointer to array
// Argument[r1]: number of elements in array
fillArray:
	LDMFD sp!, {r0, r1}
	push {r8, r9, r10, lr}
	
	// loop over array the number of elements given in r1
	// for(int i = 0; i < arrayLength; i++){
	//	image = load[i]
	//	x_cor = load[i++]
	//	y_cor = load[i++]
		
	//	drawAt(image, x_cor, y_cor)
	// }
	
	// r8 = counter
	// r9 = arrayLength
	// r10 = array
	counter		.req r10
	array		.req r9
	arrayLength 	.req r8
	
	mov arrayLength, r1
	mov array, r0
	mov r1, #3
	mul arrayLength, arrayLength, r1
	mov counter, #0
	for_fillArray:
		cmp counter, arrayLength
		bge for_fillArrayEND
		
		//	image = array[i]
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r0}

		mov r1, #5
		STMFD sp!, {r0, r1}
		bl getObjectElement
		LDMFD sp!, {r4}

		//	x_cor = load[i++]
		add counter, #1
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r5}
		//	y_cor = load[i++]
		add counter, #1
		STMFD sp!, {array, counter}
		bl getObjectElement
		LDMFD sp!, {r6}
		
		STMFD sp!, {r4, r5, r6}
		bl DrawAt

		add counter, #1
		bal for_fillArray
	for_fillArrayEND:

	.unreq counter
	.unreq array
	.unreq arrayLength
	pop {r8, r9, r10, pc}




// update the all the elements for the side data structure
// Arguments[r0, r1] ---> Return[]
// Argument[r0]: pointer to array
// Argument[r1]: number of elements in array
updateArray:
	LDMFD sp!, {r0, r1}
	push {r8, r9, r10, lr}
	
	// r8 = counter
	// r9 = arrayLength
	// r10 = array
	counter		.req r10
	array		.req r9
	arrayLength 	.req r8
	
// for(int i = 0; i < length; i++){
//	address = address + 8
//	y = load[address]
//	y = y - 32
//	str[address] = y
// }
	mov arrayLength, r1
	mov array, r0
	mov r1, #3
	//mul arrayLength, arrayLength, r1
	mov counter, #0
	for_updateArray:
		cmp counter, arrayLength
		bge for_updateArrayEND
		
		add array, #8
		ldr r0, [array]
		add r0, #32
		cmp r0, #768
		SUBGE r0, #736
		str r0, [array]

		add array, #4
		add counter, #1
		bal for_updateArray
	for_updateArrayEND:

	.unreq counter
	.unreq array
	.unreq arrayLength
	pop {r8, r9, r10, pc}

//-----------------------------------------------------------------------------
