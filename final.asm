INCLUDE Irvine32.inc

.data
Question1 PROTO,
	val1:SWORD,
	val2:SWORD,
	val3:SWORD,
	val4:SWORD

Question2 PROTO,
	array:DWORD,
	arrayLength:DWORD

Question3 PROTO,
	n:DWORD,
	k:DWORD

array1 DWORD 0,2,5,9,10

.code
main PROC

	;�Ĥ@�j�D
	;�D��
	;(3)AX= val1 * 33 / (val2 - 3) + val3 - (val4 + 1)
	INVOKE Question1,1,2,3,4
	;���׬O-35 Hex=FFDD


	;�ĤG�j�D
	;�D��
	;(2)�p��C�ӼƦr�������t���[�`
	INVOKE Question2,ADDR array1,LENGTHOF array1
	;���׬O10 Hex=A


	;�ĤT�j�D
	;�D��
	;(1) C(n,k)= n! / (k!(n - k)!)
	mov eax,0
	INVOKE Question3,7,5
	;���׬O21 Hex

	exit
main ENDP

Question1 PROC,
	val1:SWORD,
	val2:SWORD,
	val3:SWORD,
	val4:SWORD


	;�D��
	;(3)AX= val1 * 33 / (val2 - 3) + val3 - (val4 + 1)
	mov eax,0
	mov ebx,0

	;val1*33
	mov ax,val1
	mov bx,33
	imul bx

	;(val2-3)
	mov bx,val2
	sub bx,3

	;val1*33/(val2-3)
	cwd
	idiv bx

	;+val3
	add ax,val3

	;(val4+1)
	mov bx,val4
	inc bx
	;-(val4)
	sub ax,bx

	ret
Question1 ENDP

Question2 PROC,
	array:DWORD,
	arrayLength:DWORD


	;��o�}�C��m
	mov esi,array
	mov edi,esi
	add esi,4

	;��o�}�C����
	mov ecx,arrayLength
	dec ecx

	;��l��eax
	mov eax,0

	L1:
		;�p���ӼƦr���t���eax
		mov ebx,[esi]
		sub ebx,[edi]
		add eax,ebx

		;�U�@�Ӱ}�C��m
		add esi,4
		add edi,4
	loop L1

	ret
Question2 ENDP

Question3 PROC USES ebx ecx,
	n:DWORD,
	k:DWORD

	mov ebx,k
	mov ecx,n

	;if(k = 0) or (n = k)
	cmp ebx,0
	je L1
	cmp ecx,ebx
	je L1

	;if (n > k > 0)
	cmp ecx,ebx
	jbe Left
	cmp ebx,0
	jbe Left

	jmp L2

	;Return 1
	L1:
	add eax,1

	;���}
	jmp Left

	;Return c(n-1,k)+C(n-1,k-1)
	L2:
	dec ecx
	INVOKE Question3,ecx,ebx
	dec ebx
	INVOKE Question3,ecx,ebx

	;���}
	Left:
	ret
Question3 ENDP

END main