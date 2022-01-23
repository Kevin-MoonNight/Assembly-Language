INCLUDE Irvine32.inc

.data
array DWORD 5,4,3,2,1
.code
main PROC

	mov ecx,LENGTHOF array
	mov esi,OFFSET array
	dec ecx
	mov ebx,1

	L1:
		;碝т程
		push esi
		push ecx

		push esi

		mov eax,LENGTHOF array
		sub eax,ebx
		push eax
		call findSmallest

		pop ecx
		pop esi

		push esi
		push ecx

		;ユ传
		push esi
		call SWAP
		
		pop ecx
		pop esi

		inc ebx
		add esi,TYPE array
	loop L1	

	mov ecx,LENGTHOF array
	mov esi,OFFSET array

	L2:
		mov eax,[esi]
		call WriteInt
		call Crlf
		add esi,TYPE array
	loop L2

	exit
main ENDP


SWAP PROC

	push ebp
	mov ebp,esp

	;莉眔ユ传竚
	mov esi,[ebp+8]
	
	;ユ传
	mov ebx,[eax]
	xchg ebx,[esi]
	xchg ebx,[eax]

	pop ebp

	ret 4
SWAP ENDP

findSmallest PROC

	push ebp
	mov ebp,esp

	mov ecx,[ebp+8]
	mov esi,[ebp+12]
	mov eax,esi

	L1:	
		add esi,TYPE esi
		
		mov ebx,[eax]
		cmp ebx,[esi]
		jbe left

		mov eax,esi

		left:
	loop L1

	pop ebp

	ret	8
findSmallest ENDP

END main