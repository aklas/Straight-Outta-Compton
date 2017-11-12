.globl collisionDetection, overLap
// Arguments[] ---> Return[r0]
// Return[r0]: r0 = 0 no collision, r0 = 1 collided with POLICE, r0 = 2 collided with COCAINE, r0 = 3 collided with FINISH
collisionDetection:
	push {r4, r5, r6, r7, r8, r9, r10, lr}
	
	// a E A = {CAR}
	// b E B = {POLICE, COCAINE, FINISH}
	/*
	bool state = false;
	for(b E B){
		if(a.y <= (b.y + height)){
			// (Object to the left of the car) OR (Object to the right of the car)
			// if(a.x <= (b.x + b.width) || (a.x + a.width) >= b.x){
			//	return (number associated with b)
			// }
			if((b.x <= a.x && a.x <= (b.x + b.width)) || (b.x >= a.x && (a.x + a.width) >= b.x)) {
				return (number associated with b)
			}
		}
	}
	*/
	arrayCounter	.req r10
	baseAddress	.req r9
	B_temp		.req r8
	CAR_temp	.req r7
	B_element	.req r6
	CAR_element	.req r5
	GEN_temp	.req r4
	
	mov arrayCounter, #0
	ldr CAR_element, =CAR
	ldr baseAddress, =collisionArray
	for_collisionDetection:
		cmp arrayCounter, #2
		bgt for_collisionDetectionEND
			// loading b_element
			STMFD sp!, {baseAddress, arrayCounter}
			bl getObjectElement
			LDMFD sp!, {B_element}
			// if(a.y <= (b.y + height))
			// loading b_element y cordinate
			mov B_temp, #2
			STMFD sp!, {B_element, B_temp}
			bl getObjectElement
			LDMFD sp!, {B_temp}
			ldr B_temp, [B_temp]
			
			// loading b_element height cordinate
			mov CAR_temp, #4
			STMFD sp!, {B_element, CAR_temp}
			bl getObjectElement
			LDMFD sp!, {r0}
			ldr r0, [r0]
			add B_temp, B_temp, r0
			
			// loading CAR_element y cordinate
			mov CAR_temp, #2
			STMFD sp!, {CAR_element, CAR_temp}
			bl getObjectElement
			LDMFD sp!, {CAR_temp}
			ldr CAR_temp, [CAR_temp]
			
			// a.y <= (b.y + height)
			cmp CAR_temp, B_temp
			bgt skip_if_collisionDetection
				// if((b.x <= a.x && a.x <= (b.x + b.width))
				FIRST_IF_CONDITION:
				// loading B_element x cordinate
				mov B_temp, #1
				STMFD sp!, {B_element, B_temp}
				bl getObjectElement
				LDMFD sp!, {B_temp}
				ldr B_temp, [B_temp]

				// loading CAR_element x cordinate
				mov CAR_temp, #1
				STMFD sp!, {CAR_element, CAR_temp}
				bl getObjectElement
				LDMFD sp!, {CAR_temp}
				ldr CAR_temp, [CAR_temp]

				// b.x <= a.x
				cmp B_temp, CAR_temp
				bgt SECOND_IF_CONDITION
				
				// loading b_element width,(b.x + b.width)
				mov GEN_temp, B_temp
				mov B_temp, #3
				STMFD sp!, {B_element, B_temp}
				bl getObjectElement
				LDMFD sp!, {B_temp}
				ldr B_temp, [B_temp]
				add B_temp, GEN_temp, B_temp

				// if(a.x <= (b.x + b.width)
				cmp CAR_temp, B_temp
				addle arrayCounter, arrayCounter, #1
				ble collisionDetectionEXIT
				
				
				SECOND_IF_CONDITION:
				// (b.x >= a.x && (a.x + a.width) >= b.x)
				// loading B_element x cordinate
				mov B_temp, #1
				STMFD sp!, {B_element, B_temp}
				bl getObjectElement
				LDMFD sp!, {B_temp}
				ldr B_temp, [B_temp]

				// loading CAR_element x cordinate
				mov CAR_temp, #1
				STMFD sp!, {CAR_element, CAR_temp}
				bl getObjectElement
				LDMFD sp!, {CAR_temp}
				ldr CAR_temp, [CAR_temp]
				
				// b.x >= a.x
				cmp B_temp, CAR_temp
				blt skip_if_collisionDetection

				// loading CAR_element width (a.x + a.width)
				mov GEN_temp, CAR_temp
				mov CAR_temp, #3
				STMFD sp!, {CAR_element, CAR_temp}
				bl getObjectElement
				LDMFD sp!, {CAR_temp}
				ldr CAR_temp, [CAR_temp]
				add CAR_temp, GEN_temp, CAR_temp

				// if((a.x + a.width) >= b.x)
				cmp CAR_temp, B_temp
				addge arrayCounter, arrayCounter, #1
				bge collisionDetectionEXIT
				

			skip_if_collisionDetection:
		add arrayCounter, arrayCounter, #1
		bal for_collisionDetection
	for_collisionDetectionEND:
	mov arrayCounter, #0
	collisionDetectionEXIT:
	mov r0, arrayCounter
	pop {r4, r5, r6, r7, r8, r9, r10, lr}
	STMFD sp!, {r0}
	mov pc, lr

// Arguments[r0, r1] ---> Return[r0]
// Return[r0]: r0 = TRUE/FALSE
overLap:
	LDMFD sp!, {r0, r1}
	push {r4, r5, r6, r7, r8, r9, r10, lr}
	
	

	pop {r4, r5, r6, r7, r8, r9, r10, lr}
	
	
.section .data
collisionArray:	.word POLICE, COCAINE, FINISH

/*
				
				
				// if(a.x <= (b.x + width)
				cmp CAR_temp, B_temp
				firstBREAK:
				addle arrayCounter, arrayCounter, #1
				ble collisionDetectionEXIT
					
					// loading CAR_element x cordinate
					mov CAR_temp, #1
					STMFD sp!, {CAR_element, CAR_temp}
					bl getObjectElement
					LDMFD sp!, {CAR_temp}
					ldr CAR_temp, [CAR_temp]
				
					// loading CAR_element width cordinate
					mov B_temp, #3
					STMFD sp!, {CAR_element, B_temp}
					bl getObjectElement
					LDMFD sp!, {r0}
					ldr r0, [r0]
					add CAR_temp, CAR_temp, r0
					
					// loading b_element x cordinate
					mov B_temp, #1
					STMFD sp!, {B_element, B_temp}
					bl getObjectElement
					LDMFD sp!, {B_temp}
					ldr B_temp, [B_temp]
					
					// if(a.x + width) >= b.x)
					cmp CAR_temp, B_temp
					secondBREAK:
					addge arrayCounter, arrayCounter, #1
					bge collisionDetectionEXIT
*/
