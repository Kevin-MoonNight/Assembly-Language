.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

X DWORD ?
vall DWORD ?

.code
main PROC

;�Ĥ@�D
;----------------
;    cmp ebx,ecx
;    ja L1
;    L1:
;        mov X,1
;----------------
;�ĤG�D
;----------------
;    cmp ebx,ecx
;    jbe L1
;    mov X,2
;    jmp L2
;    L1:
;        mov X,1
;    L2:
;----------------
;�ĤT�D
;----------------
;    cmp ebx,ecx
;    je L1
;    mov X,2
;    jmp L2
;    L1:
;        mov X,1
;    L2:
;----------------
;�ĥ|�D
;----------------
;    cmp ebx,ecx
;    jne L1
;    mov X,2
;    jmp L2
;    L1:
;        mov X,1
;    L2:
;----------------
;�Ĥ��D
;----------------
;    cmp vall,ecx
;    ja L1
;    mov X,2
;    jmp next
;    L1:
;        cmp ecx,edx
;        ja L2
;        jmp next
;        L2:
;          mov X,1
;    next:
;----------------
;�Ĥ��D
;----------------
;    cmp ebx,ecx
;    ja L1
;    cmp ebx,vall
;    ja L1
;    mov X,2
;    jmp next
;    L1:
;        mov X,1
;    next:
;----------------
;�ĤC�D
;----------------
;    cmp ebx,ecx
;    ja L1
;    cmp edx,eax
;    ja L2
;    mov X,2
;    jmp next
;    L1:
;        cmp ebx,edx
;        ja L2
;        mov X,2
;        jmp next
;    L2:
;        mov X,1
;    next:
;----------------

  	INVOKE ExitProcess,0
main ENDP

END main