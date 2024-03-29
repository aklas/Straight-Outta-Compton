.section .data
.globl FIVE

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//FIVE Object%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//Attributes: Image, x_cor, y_cor, width, height %%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

.align

FIVE:
	.word Image_FIVE, X_cor_FIVE, Y_cor_FIVE, Width_FIVE, Height_FIVE, BLACKNum
	
Image_FIVE:

.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\305$\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\305$\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\211%\305$\0\0\0\0\0\0E\1\211\35"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\305$\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%"
.ascii "\"\33\2\0\311\24\211%\211%\211%\211%\211%\305$\0\0\0\0\0\0E\1"
.ascii "\211\35\211%\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0E\1\211\35\211%"
.ascii "\211%\211%\211%\211%\"\33\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\343#\0\0\0\0\0\0\0\0E\1\211\35\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\"\33"
.ascii "\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\343#\0\0\0\0\0\0E\1\211\35\211%"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\305$\0\0\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\305$\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\2\0\311\24\211%\211%\211%\211%\211%\305$"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\2\0\311\24\211%"
.ascii "\211%\211%\211%\211%\305$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\2\0\311\24\211%\211%\211%\211%\211%\305$\0\0\0\0"
.ascii "\0\0E\1\211\35\211%\211%\211%\211%\211%\"\33\2\0\311\24\211%"
.ascii "\211%\211%\211%\211%\305$\0\0\0\0\0\0E\1\211\35\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\305$\0\0"
.ascii "\0\0\0\0E\1\211\35\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\211%\343#\0\0\0\0\0\0E\1\211\35\211%\211%"
.ascii "\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\211%\"\33"
.ascii "\0\0\0\0\0\0\0\0&\2\211%\211%\211%\211%\211%\211%\211%\211%"
.ascii "\211%\211%\211%\211%\343#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
.ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

.align
X_cor_FIVE:
	.int 100

.align	
Y_cor_FIVE:
	.int 3
	
.align	
Width_FIVE:
	.int 19

.align	
Height_FIVE:
	.int 23
