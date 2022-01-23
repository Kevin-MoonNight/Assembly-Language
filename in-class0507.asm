INCLUDE Irvine32.inc

.data
count dword 10
BlueTextOnGray = blue + (lightGray * 16)

.code
main proc

	mov   eax,BlueTextOnGray
	call  SetTextColor
	call  CountDown

	exit
main endp
		
CountDown proc

	L1:
	mov eax,100
	mov eax,RandomRange 
	call Gotoxy
	call  Clrscr

	mov eax,count
	call WriteInt

	mov eax,1000
	call Delay

	dec count

	cmp count,0
	ja L1



CountDown endp

end main	