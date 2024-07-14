;; define a macro for readability
%define TextVideoBiosMemory 0b800h
%define ColorlessTextVidoMemory 0b000h


;; Set the working offset
;; as we are in real mode this is
;; not necassery (we are not using far calls)
;;
org 7c00h
section .text
entry:
mov eax,0beefh
mov si, TextVideoBiosMemory 
mov es, si ;
mov si, 07c0h 
mov sp,si
mov ds, si 

mov si, (Message-$$)
xor di,di
mov ss,di

pusha
pushf

mov dx,16
show:

pop bx
call atoi
dec dx
test dx,dx
jnz show
nopsled:
nop
jmp nopsled
hlt

Message db 'H',0xff,'E',0xff,'L',0xff,'L',0xff,'O',0xff,0x01,0xff
MSGLEN equ $-Message
%include "sim\hexatio.s"
TIMES 510-($-$$) DB 0 
DW 0xAA55

