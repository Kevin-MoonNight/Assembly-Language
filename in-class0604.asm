INCLUDE Irvine32.inc

.data
val1 DWORD 1234h
val2 DWORD 100h
.code
main PROC
	;第一題
	mov eax,1234h
	mul val2

	;第二題
	mov eax,00128765h
	mov val2,10000h
	mul val2

	;第三題
	mov eax,8760h
	mov val2,100h
	mul val2

	;第四題
	mov eax,00876000h
	mov val2,100h
	mul val2

	;第五題
	mov eax,00876002h
	mov val2,10h
	mul val2

	;第六題
	mov eax,0FDFFh
	mov val2,100h
	mul val2


	exit
main ENDP

END main