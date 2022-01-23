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
	
	;�s�X
	INVOKE Encryption,ADDR plaintext,ADDR key,LENGTHOF plaintext,LENGTHOF key

	mov ecx,LENGTHOF plaintext
	mov edi,OFFSET plaintext

	L1:
		mov al,[edi]

		call WriteChar

		inc edi
	loop L1

	call Crlf

	;�ѽX key2�O���ʦ^�h �Ψ����ҽs�X�O�_�T
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
		;����
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

		;�P�_�n�����䲾
		cmp cl,0
		jge Right

		;����
		neg cl
		rol al,cl
		jmp Left

		;���k
		Right:
		ror al,cl

		;���}
		Left:
		pop ecx

		stosb
	loop L1

	ret
Rotating ENDP


END main