INCLUDE Irvine32.inc

.data
plaintext BYTE "abcdefg"
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
key2 BYTE -6,4,4,-2,-5,3,0,-1,-4,2

Encryption PROTO,
	text:DWORD,
	keys:DWORD,
	textLength:DWORD,
	keyLength:DWORD

Rotating PROTO,
	text:DWORD,
	textLength:DWORD,
	n:BYTE

.code
main PROC
	
	;編碼
	INVOKE Encryption,ADDR plaintext,ADDR key,LENGTHOF plaintext,LENGTHOF key

	mov ecx,LENGTHOF plaintext
	mov edi,OFFSET plaintext

	L1:
		mov al,[edi]

		call WriteChar

		inc edi
	loop L1

	call Crlf

	;解碼 key2是移動回去 用來驗證編碼是否確
	INVOKE Encryption,ADDR plaintext,ADDR key2,LENGTHOF plaintext,LENGTHOF key

	mov ecx,LENGTHOF plaintext
	mov edi,OFFSET plaintext

	L2:
		mov al,[edi]

		call WriteChar

		inc edi
	loop L2
	
	call Crlf

	exit
main ENDP

Encryption PROC,
	text:DWORD,
	keys:DWORD,
	textLength:DWORD,
	keyLength:DWORD
	
	mov ecx,keyLength
	mov edi,keys

	L1:	
		mov al,[edi]
		;移動
		INVOKE Rotating,text,textLength,al

		inc edi
	loop L1

	ret
Encryption ENDP

Rotating PROC USES edi ecx,
	text:DWORD,
	textLength:DWORD,
	n:BYTE
	
	mov esi,text
	mov edi,esi
	mov ecx,textLength

	L1:
		mov eax,0
		lodsb
		push ecx
		mov cl,n

		clc

		;判斷要往哪邊移
		cmp cl,0
		jge Right

		;往左
		neg cl
		rol al,cl
		jmp Left

		;往右
		Right:
		ror al,cl

		;離開
		Left:
		pop ecx

		stosb
	loop L1

	ret
Rotating ENDP


END main