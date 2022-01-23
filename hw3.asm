.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
key BYTE "ABXnv#7"
plaintext BYTE "This is a Plaintext message"

.code
main PROC
    
    ;指標 指向plaintext
    mov esi,OFFSET plaintext          
    ;將plaintext的大小存放到ecx裡面
    mov ecx,LENGTHOF plaintext

    ;用來判斷輪到key的第幾位
    mov edi,0
    mov eax,0

    L1:
        
        ;運行XOR
        mov al,[esi]    
        xor al,key[edi]
        mov [esi],al

        ;plaintext位置 + 1
        add esi,TYPE plaintext   
        
        ;key位置 + 1
        add edi,TYPE key   

        ;判斷key目前位置是不是超出範圍 如果是的話回到起點
        cmp edi,LENGTHOF key / TYPE key
        jb next
        mov edi,0;回到起點

        next:

    loop L1


  	INVOKE ExitProcess,0
main ENDP

END main