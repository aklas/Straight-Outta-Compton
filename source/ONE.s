.section .data
.globl ONE

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//ONE Object%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//Attributes: Image, x_cor, y_cor, width, height %%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

.align
ONE:
	.word Image_ONE, X_cor_ONE, Y_cor_ONE, Width_ONE, Height_ONE, BLACKNum
	
Image_ONE:
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%"
.ascii "\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%"
.ascii "\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%"
.ascii "\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%"
.ascii "\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"


.align
X_cor_ONE:
	.int 100

.align	
Y_cor_ONE:
	.int 3

.align	
Width_ONE:
	.int 19

.align	
Height_ONE:
	.int 23