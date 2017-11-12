.section .text
.globl sideLoop	
	
// loop:
// 	paint to screen
// 	fill screen
// 	update
//	branch to loop
	
sideLoop:
	push {lr}
	ldr r0, =grassObjectArray
	mov r1, #52
	STMFD sp!, {r0, r1}
	bl paintArray


	//ldr r0, =0xFFF
	//STMFD sp!, {r0}
	//bl Wait


	ldr r0, =grassObjectArray
	mov r1, #52
	STMFD sp!, {r0, r1}
	bl fillArray

	ldr r0, =grassObjectArray
	mov r1, #52
	STMFD sp!, {r0, r1}
	bl updateArray

	pop {pc}


.section .data
grassObjectArray:
grassObjectArray:
	// LEFT SIDE (14)
	.word	SHRUB_B
	.int	0
	.int	0
	.word	SHRUB_A
	.int	64
	.int	0

	.word	SHRUB_B
	.int	128
	.int	32

	.word	SHRUB_A
	.int	32
	.int	128
	.word	SHRUB_B
	.int	160
	.int	128

	.word	SHRUB_A
	.int	96
	.int	224

	.word	SHRUB_B
	.int	0
	.int	288

	.word	SHRUB_A
	.int	96
	.int	352

	.word	SHRUB_B
	.int	32
	.int	448
	.word	SHRUB_A
	.int	128
	.int	448
	
	.word	SHRUB_B
	.int	64
	.int	544
	
	.word	SHRUB_A
	.int	0
	.int	640
	.word	SHRUB_B
	.int	96
	.int	640
	
	.word	SHRUB_A
	.int	160
	.int	732
	
	// RIGHT SIDE (14)
	.word	SHRUB_B
	.int	0 + 832
	.int	32
	.word	SHRUB_A
	.int	64 + 832
	.int	32

	.word	SHRUB_B
	.int	128 + 832
	.int	32

	.word	SHRUB_A
	.int	32 + 832
	.int	128
	.word	SHRUB_B
	.int	160 + 832
	.int	128

	.word	SHRUB_A
	.int	96 + 832
	.int	224

	.word	SHRUB_B
	.int	0 + 832
	.int	288

	.word	SHRUB_A
	.int	96 + 832
	.int	352

	.word	SHRUB_B
	.int	32 + 832
	.int	448
	.word	SHRUB_A
	.int	128 + 832
	.int	448
	
	.word	SHRUB_B
	.int	64 + 832
	.int	544
	
	.word	SHRUB_A
	.int	0 + 832
	.int	640
	.word	SHRUB_B
	.int	96 + 832
	.int	640
	
	.word	SHRUB_A
	.int	160 + 832
	.int	732

	// LEFT MEDIAN (12)
	.word	MEDIAN
	.int	384
	.int	0
	.word	MEDIAN
	.int	384
	.int	64
	.word	MEDIAN
	.int	384
	.int	128
	.word	MEDIAN
	.int	384
	.int	192
	.word	MEDIAN
	.int	384
	.int	256
	.word	MEDIAN
	.int	384
	.int	320
	.word	MEDIAN
	.int	384
	.int	384
	.word	MEDIAN
	.int	384
	.int	448
	.word	MEDIAN
	.int	384
	.int	512
	.word	MEDIAN
	.int	384
	.int	576
	.word	MEDIAN
	.int	384
	.int	640
	.word	MEDIAN
	.int	384
	.int	704

	// RIGHT MEDIAN (12)
	.word	MEDIAN
	.int	608
	.int	0
	.word	MEDIAN
	.int	608
	.int	64
	.word	MEDIAN
	.int	608
	.int	128
	.word	MEDIAN
	.int	608
	.int	192
	.word	MEDIAN
	.int	608
	.int	256
	.word	MEDIAN
	.int	608
	.int	320
	.word	MEDIAN
	.int	608
	.int	384
	.word	MEDIAN
	.int	608
	.int	448
	.word	MEDIAN
	.int	608
	.int	512
	.word	MEDIAN
	.int	608
	.int	576
	.word	MEDIAN
	.int	608
	.int	640
	.word	MEDIAN
	.int	608
	.int	704
