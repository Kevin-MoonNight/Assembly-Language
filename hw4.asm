include Irvine32.inc

.data
x DWORD 10h,20h,30h,50h,70h
y DWORD 10h,20h,40h,20h,70h

.code
main PROC
	
	;�ǤJ�}�C�Ѽ�X�BY�H�ΰ}�C�j�p
	push LENGTHOF x
	push OFFSET y
	push OFFSET x
	
	;�P�_�۲Ū��Ʀr
	call CountMatches
	;��X���G
	call WriteDec
	call Crlf

	exit
main ENDP

CountMatches PROC

	push ebp
	mov ebp,esp

	mov eax,0
	mov esi,[ebp+8]
	mov ebx,[ebp+12]
	mov ecx,[ebp+16]

	L1:
		;�P�_��ӼƦr�O�_�@��
		mov edx,[esi]
		cmp edx,[ebx]

		;�p�G���۵��N��+1
		jne left

		;EAX+1
		add eax,1

		left:
		add esi,4
		add ebx,4
	loop L1

	pop ebp

	ret 8
CountMatches ENDP

END main