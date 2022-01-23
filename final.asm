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

	;第一大題
	;題目
	;(3)AX= val1 * 33 / (val2 - 3) + val3 - (val4 + 1)
	INVOKE Question1,1,2,3,4
	;答案是-35 Hex=FFDD


	;第二大題
	;題目
	;(2)計算每個數字之間的差的加總
	INVOKE Question2,ADDR array1,LENGTHOF array1
	;答案是10 Hex=A


	;第三大題
	;題目
	;(1) C(n,k)= n! / (k!(n - k)!)
	mov eax,0
	INVOKE Question3,7,5
	;答案是21 Hex

	exit
main ENDP

Question1 PROC,
	val1:SWORD,
	val2:SWORD,
	val3:SWORD,
	val4:SWORD


	;題目
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


	;獲得陣列位置
	mov esi,array
	mov edi,esi
	add esi,4

	;獲得陣列長度
	mov ecx,arrayLength
	dec ecx

	;初始化eax
	mov eax,0

	L1:
		;計算兩個數字的差放到eax
		mov ebx,[esi]
		sub ebx,[edi]
		add eax,ebx

		;下一個陣列位置
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

	;離開
	jmp Left

	;Return c(n-1,k)+C(n-1,k-1)
	L2:
	dec ecx
	INVOKE Question3,ecx,ebx
	dec ebx
	INVOKE Question3,ecx,ebx

	;離開
	Left:
	ret
Question3 ENDP

END main