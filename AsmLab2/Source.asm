.686
.model flat,stdcall
.stack 100h
.data
x DW 6da9h
y DW 11fah
l dw ?
m dw ?
r dw ?
.code
;Найти значение L
FindL:
	cmp cx,4 ;цикл if с 4 проходами
	jnl EndFindL ; после выполнения цикла
	inc cx
	sub ax, y ;сложение X и Y
	jmp FindL
EndFindL:
	mov l, ax
	xor ax, y; после выполенения цикла логическая операция
	mov m, ax
	ret
;найти значение R
FindR:
	cmp ax,0; сравнение m>0
	jnle EndFindR
	neg ax ;смена знака у числа
	ret
EndFindR:
	and ax, 0F0Fh ;и между m и числом
	ret

RAdr1:
	mov ax, 27E1h
	xor ax, l
	ret
RAdr2:
	add ax, 67A1h
	sub ax, l
	ret
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx
mov ax,x
call FindL
call FindR
mov r, ax ; добавление числа r
cmp r,0 ;сравнение  с 0
je RAdr1
jmp RAdr2
exit:
Invoke ExitProcess,1
End Start