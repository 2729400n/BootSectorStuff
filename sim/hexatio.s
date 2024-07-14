atoi:
push bp ;; store registers to be used
push dx
push cx


mov ax,1f30h
mov es:di,ax
add di,2
mov ax,1f62h
mov es:di,ax
add di,2
;; setup counters
mov al,1fh ;; y counter and 
mov cx,19 ;; x counter


ShiftY:

getDigits:

cmp cx,15
je outer
cmp cx,10
je outer
cmp cx,5
je outer

movzx bp,bl ;; get the lowest byte
and bp,01h ;; get the lowest bit digit

lea si,[bp+(NUMBERLINE-$$)] ;; use the numberline to get the required character
movsb ;; write character to screen

mov es:di, al ;;
inc di ;;
shr bx, 1 ;;
next:
loop getDigits

add di,160-(21*2) ;; new line 




;clear frame and return
pop cx
pop dx
pop bp
ret

outer:
mov ax,1f20h
mov es:di, ax ;;
add di,2 ;;
mov al,1fh
jmp next


NUMBERLINE db "0123456789ABCDEF"