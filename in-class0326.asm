.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


;第一題
;.data
;sum DWORD ?
;.code
;main PROC
;    mov ecx ,100
;    mov eax ,0
;    L1:
;        add eax,ecx
;        loop L1
;
;    mov sum,eax
;
;  	INVOKE ExitProcess,0
;main ENDP

;第二題
.data
array DWORD 10h,20h,30h
sum DWORD ?
.code
main PROC
    
    mov esi,OFFSET array
    mov ecx,LENGTHOF array
    mov eax,0
    L1:
        add eax, [esi]
        add esi,TYPE array

        loop L1

        mov sum,eax

  	INVOKE ExitProcess,0
main ENDP

END main