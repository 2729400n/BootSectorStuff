PUBLIC entry

.CODE
ORG 7c00h
entry:
    mov ax, 8b00h ;; 
    mov ds, ax
    xor ax,ax
    movsb
	hlt
END 
.DATA
ORG 8b00h