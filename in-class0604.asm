INCLUDE Irvine32.inc

.data
val1 DWORD 1234h
val2 DWORD 100h
.code
main PROC
	;�Ĥ@�D
	mov eax,1234h
	mul val2

	;�ĤG�D
	mov eax,00128765h
	mov val2,10000h
	mul val2

	;�ĤT�D
	mov eax,8760h
	mov val2,100h
	mul val2

	;�ĥ|�D
	mov eax,00876000h
	mov val2,100h
	mul val2

	;�Ĥ��D
	mov eax,00876002h
	mov val2,10h
	mul val2

	;�Ĥ��D
	mov eax,0FDFFh
	mov val2,100h
	mul val2


	exit
main ENDP

END main