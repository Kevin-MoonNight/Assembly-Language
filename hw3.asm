.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
key BYTE "ABXnv#7"
plaintext BYTE "This is a Plaintext message"

.code
main PROC
    
    ;���� ���Vplaintext
    mov esi,OFFSET plaintext          
    ;�Nplaintext���j�p�s���ecx�̭�
    mov ecx,LENGTHOF plaintext

    ;�ΨӧP�_����key���ĴX��
    mov edi,0
    mov eax,0

    L1:
        
        ;�B��XOR
        mov al,[esi]    
        xor al,key[edi]
        mov [esi],al

        ;plaintext��m + 1
        add esi,TYPE plaintext   
        
        ;key��m + 1
        add edi,TYPE key   

        ;�P�_key�ثe��m�O���O�W�X�d�� �p�G�O���ܦ^��_�I
        cmp edi,LENGTHOF key / TYPE key
        jb next
        mov edi,0;�^��_�I

        next:

    loop L1


  	INVOKE ExitProcess,0
main ENDP

END main