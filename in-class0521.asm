include Irvine32.inc

.data
array DWORD 10,20,30

.code

main PROC

	;�ǤJ�Ѽ�
	push OFFSET array
	push LENGTHOF array
	
	call FindLargest

	exit
main ENDP

FindLargest PROC
	
	push ebp
	mov ebp,esp

	;��o�Ѽ�
	mov ecx,[ebp+8]
	mov esi,[ebp+12]
	mov eax,0

	;��̤j��
	L1:
		cmp [esi],eax
		jbe next
		mov eax,[esi]
		next:
		add esi,TYPE esi
	loop L1

	pop ebp

	ret 8
FindLargest ENDP


END main


