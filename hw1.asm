.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

.code
main PROC
	
	;1¸ò4¥æ´«
	mov al,bigEndian
	xchg al,bigEndian+3
	mov	bigEndian,al
	
	;2¸ò3¥æ´«
	mov al,bigEndian +1
	xchg al,bigEndian+2
	mov	bigEndian+1,al

	mov eax,DWORD PTR bigEndian
	mov littleEndian,eax

	INVOKE ExitProcess,0
main ENDP

END main