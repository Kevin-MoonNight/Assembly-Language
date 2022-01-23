INCLUDE Irvine32.inc

.data
targetStr BYTE "ABCDE",10 DUP(0)
sourceStr BYTE "FGH",0

Str_concat PROTO,
	Str1:PTR BYTE,
	Str2:PTR BYTE

.code
main PROC

	INVOKE Str_concat,ADDR targetStr,ADDR sourceStr

	mov ecx,LENGTHOF targetStr
	mov esi,OFFSET targetStr

	L1:
		mov al,[esi]
		call WriteChar
		inc esi
	loop L1

	call Crlf

	exit
main ENDP

Str_concat PROC,
	Str1:PTR BYTE,
	Str2:PTR BYTE

	;��oStr2����
	INVOKE Str_length,ADDR Str2
	mov ecx,eax

	;��oStr1���� (�����D���ƻ򥦨�����Str1������)
	INVOKE Str_length,ADDR Str1
	;�ҥH�ۤv�[�W�h
	mov eax,5
	;��o�}�C��m
	add eax,Str1
	
	;�ƻs�r��
	cld
	mov esi,Str2
	mov edi,eax
	rep movsb

	ret
Str_concat ENDP

END main