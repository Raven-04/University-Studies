TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	str1 byte "Enter a decimal number: ", 0
	str2 byte "The first element that is multiple of 5 and 7 is ", 0
	str3 byte " at index ", 0
	str4 byte "No multiple of 5 and 7 is entered", 0
	A dword 10 DUP(?)
	i dword 0

.code
main PROC
	mov edx, offset str1
	
	mov esi, offset A
	mov ecx, lengthof A

fillA:
	call writestring
	call readint
	mov [esi], eax
	add esi, 4
	loop fillA

	mov esi, offset A
	mov ecx, lengthof A

findMult:
	mov eax, [esi]
	cdq

	mov ebx, 5
	idiv ebx
	cmp edx, 0
	jnz notDivisible

	mov eax, [esi]
	cdq

	mov ebx, 7
	idiv ebx
	cmp edx, 0
	jnz notDivisible

	mov edx, offset str2
	call writestring
	mov eax, [esi]
	call writeint
	
	mov edx, offset str3
	call writestring
	mov eax, i
	call writedec
	call crlf
	jmp endProgram

notDivisible:
	inc i
	add esi, 4
	loop findMult

	mov edx, offset str4
	call writestring
	call crlf

endProgram:

	exit
main ENDP
END main