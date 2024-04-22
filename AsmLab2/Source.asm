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
;����� �������� L
FindL:
	cmp cx,4 ;���� if � 4 ���������
	jnl EndFindL ; ����� ���������� �����
	inc cx
	sub ax, y ;�������� X � Y
	jmp FindL
EndFindL:
	mov l, ax
	xor ax, y; ����� ����������� ����� ���������� ��������
	mov m, ax
	ret
;����� �������� R
FindR:
	cmp ax,0; ��������� m>0
	jnle EndFindR
	neg ax ;����� ����� � �����
	ret
EndFindR:
	and ax, 0F0Fh ;� ����� m � ������
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
mov r, ax ; ���������� ����� r
cmp r,0 ;���������  � 0
je RAdr1
jmp RAdr2
exit:
Invoke ExitProcess,1
End Start