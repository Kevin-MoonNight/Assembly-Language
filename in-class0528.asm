include Irvine32.inc

.data
x DWORD 10
y DWORD 20

.code
main PROC

	push OFFSET x
	push OFFSET y
	call Swap

	mov eax,x
	mov eax,y

	exit
main ENDP

Swap PROC
	push ebp
	mov ebp,esp
	
	mov eax,[ebp+8]
	mov ebx,[ebp+12]
	
	mov ecx,[eax]

	xchg ecx,[ebx]
	xchg ecx,[eax]

	pop ebp

	ret 8
Swap ENDP

END main