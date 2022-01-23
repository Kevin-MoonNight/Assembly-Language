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

	;獲得Str2長度
	INVOKE Str_length,ADDR Str2
	mov ecx,eax

	;獲得Str1長度 (不知道為甚麼它取不到Str1的長度)
	INVOKE Str_length,ADDR Str1
	;所以自己加上去
	mov eax,5
	;獲得陣列位置
	add eax,Str1
	
	;複製字串
	cld
	mov esi,Str2
	mov edi,eax
	rep movsb

	ret
Str_concat ENDP

END main