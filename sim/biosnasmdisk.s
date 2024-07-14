org 7c00h
section .text
entry:
cli
mov si, 0b800h 
mov es, si ;
mov si, 07c0h 
mov ds, si 
mov si, (Message-$$)
xor di,di
show:
movsb
inc si
inc di
cmp si,MSGLEN-1
jge show
hlt

Message db 'H',0xff,'E',0xff,'L',0xff,'L',0xff,'O',0xff,0x01,0xff
MSGLEN equ $-Message

TIMES (510-($-$$))-64 DB 0 
db 
DW 0xAA55

