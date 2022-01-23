include Irvine32.inc

.data
x DWORD 10h,20h,30h,50h,70h
y DWORD 10h,20h,40h,20h,70h

.code
main PROC
	
	;肚皚把计XYの皚
	push LENGTHOF x
	push OFFSET y
	push OFFSET x
	
	;耞才计
	call CountMatches
	;块挡狦
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
		;耞ㄢ计琌妓
		mov edx,[esi]
		cmp edx,[ebx]

		;狦ぃ单碞ぃ+1
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