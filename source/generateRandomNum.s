.globl     generateRandomNum, initGenerateRandomNum
.section .text
/*
uint32_t x, y, z, w;
uint32_t xorshift128(void) {
    uint32_t t = x;
    t ^= t << 11;
    t ^= t >> 8;
    x = y; y = z; z = w;
    w ^= w >> 19;
    w ^= t;
    return w;
}
*/
// Arguments[] ---> Return[r0]
// Return[r0]: random number x such that a <= x <= b and x = nc for some intger n
X .req r10
Y .req r9
Z .req r8
W .req r7
T .req r6

generateRandomNum:
	push {r6, r7, r8, r9, r10, lr}
	
	ldr X, =generateRandomNum_X
	ldr X, [X]
	ldr Y, =generateRandomNum_Y
	ldr Y, [Y]
	ldr Z, =generateRandomNum_Z
	ldr Z, [Z]
	ldr W, =generateRandomNum_W
	ldr W, [W]
	
	// uint32_t t = x;
	mov T, X
	// t ^= t << 11;
	mov r0, T
	lsl r0, #11
	eor T, T, r0
	// t ^= t >> 8;
	mov r0, T
	lsr r0, #8
	eor T, T, r0
	// x = y; y = z; z = w;
	mov X, Y
	mov Y, Z
	mov Z, W
	// w ^= w >> 19;
	mov r0, W
	lsr r0, #19
	eor W, r0, W
	// w ^= t;
	eor W, W, T

	// store registers back
	ldr r0, =generateRandomNum_X
	str X, [r0]	
	ldr r0, =generateRandomNum_Y
	str Y, [r0]
	ldr r0, =generateRandomNum_Z
	str Z, [r0]
	ldr r0, =generateRandomNum_W
	str W, [r0]
	mov r0, W

	lsr r0, #30
	cmp r0, #3
	MOVEQ r0, #0

	pop {r6, r7, r8, r9, r10, lr}
	STMFD sp!, {r0}
	.unreq X
	.unreq Y
	.unreq Z
	.unreq W
	.unreq T
	mov pc, lr
/*
initGenerateRandomNum:
	push {lr}
	mov r0, #100
	
	ldr r1, =generateRandomNum_X	// pointer to where to store X
	str r0, [r1]			// storing X
	
	ldr r1, =generateRandomNum_Y
	str r0, [r1]
	
	ldr r1, =generateRandomNum_Z
	str r0, [r1]
	
	ldr r1, =generateRandomNum_W
	str r0, [r1]
	
	pop {pc}
*/
.section .data
.align
generateRandomNum_X: .int 3212654
generateRandomNum_Y: .int 984
generateRandomNum_Z: .int 315454568
generateRandomNum_W: .int 546546

