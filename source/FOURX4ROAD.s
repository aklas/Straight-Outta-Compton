.section .data
.globl FOURX4ROAD

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//Road Object %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//Attributes: Image, x_cor, y_cor, width, height %%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

.align
FOURX4ROAD:
	.word Image_FOURX4ROAD, X_cor_FOURX4ROAD, Y_cor_FOURX4ROAD, Width_FOURX4ROAD, Height_FOURX4ROAD

.align
Image_FOURX4ROAD:
.ascii "\357{mk,c\317{\20\204\317{\357{q\214\20\204\357{Q\214Q\214\357{"
.ascii "\317{Q\214\317{"

.align
X_cor_FOURX4ROAD:
	.int	192

.align
Y_cor_FOURX4ROAD:
	.int	0
	
.align
Width_FOURX4ROAD:
	.int	4

.align
Height_FOURX4ROAD:
	.int	4


