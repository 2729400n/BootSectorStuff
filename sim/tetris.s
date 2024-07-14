screenWidth equ 80
screenHeight equ 25
safeAre equ (screenWidth-9)
maxBlockWidth equ 4
maxBlockHeight equ 4


org 7c00h
.section .text
Entry:


CreateBlock:
ChooseLocation:


shr ax,1
WritePixel:
loop


