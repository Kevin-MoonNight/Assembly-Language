.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array BYTE 10h,20h,30h,40h

.code
main PROC
    
    mov esi,OFFSET array
    mov ecx,LENGTHOF array - TYPE array

    mov al,array

    L1:

        add esi,TYPE array
        xchg al,[esi]
        mov array,al

        loop L1

  	INVOKE ExitProcess,0
main ENDP

END main