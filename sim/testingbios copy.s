;; define a macro for readability
%define TextVideoBiosMemory 0b800h
%define ColorlessTextVidoMemory 0b000h

org 7c00h
section .text
entry:

;;Setup vid memory and segment registers

xor di,di
mov ss,di

mov si, TextVideoBiosMemory 
mov es, si ;
mov si, 07c0h 
mov sp,si
mov ds, si 


mov si,(MSG-$$)
write:
movsb
inc si
add di,2
cmp si,9
jne write

xor di,di
hlt
pusha ;;
pushf ;;

mov ax, 0x0f10 ;; y counter and 

ShiftY:

pop bx ;;
call atoi;



dec ax ;; 

test al, al;;
jnz ShiftY

nopsled:
nop ;; A forever loop
jmp nopsled ;;

hlt ;; just incase we need to halt

MSG db "HELLO World!" 

%include "sim\hexatio.s" ;;
TIMES 510-($-$$) DB 0 
DW 0xAA55