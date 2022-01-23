.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD ?
count DWORD ?

.code
main PROC
    mov sum,0
    mov count,1

    L1: cmp sum,1000
        jae next
        mov eax,count
        add sum,eax
        inc count

        jmp L1
        next:
    mov eax,sum

  	INVOKE ExitProcess,0
main ENDP

END main