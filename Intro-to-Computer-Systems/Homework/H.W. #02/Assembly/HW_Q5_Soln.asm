TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	str1 byte "Enter the value of EBX as a signed decimal number: ", 0
	str2 byte "The 2s complement of EBX is: ", 0
	str3 byte "The number of EBX bits that have a value equal to 1 is: ", 0
	str4 byte "The value of EBX after setting the second and third bytes is: ", 0

.code
main PROC
	mov edx, offset str1
	call writestring
	call readint
	mov ebx, eax

	mov edx, offset str2
	call writestring
	xor eax, 0FFFFFFFFh
	inc eax
	call writehex
	call crlf

	mov edx, offset str3
	call writestring

	mov ecx, 32
	mov eax, 0

countBits:
	ror ebx, 1
	jc bitIsOne
	jmp continueCount
bitIsOne:
	inc eax
continueCount:
	loop countBits

	call writeint
	call crlf

	mov edx, offset str4
	call writestring
	or ebx, 000FFFF00h
	mov eax, ebx
	call writehex

	call crlf

	exit
main ENDP
END main