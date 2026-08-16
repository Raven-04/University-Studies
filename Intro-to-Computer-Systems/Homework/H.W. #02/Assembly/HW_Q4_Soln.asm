TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	A dword 6 DUP(?)
	B dword 6 DUP(?)
	str1 byte "Enter the elements of array A", 0
	str2 byte "Enter the elements of array B", 0
	str3 byte "The array A is:", 0
	str4 byte "The array B is:", 0

.code
main PROC
	mov edx, offset str1
	call writestring
	call crlf

	mov esi, offset A
	mov ecx, lengthof A

fillA:
	call readint
	mov [esi], eax
	add esi, 4
	loop fillA

	mov edx, offset str2
	call writestring
	call crlf

	mov edi, offset B
	mov ecx, lengthof B

fillB:
	call readint
	mov [edi], eax
	add edi, 4
	loop fillB

	mov esi, offset A
	mov edi, offset B
	mov ecx, 6

swapLoop:
	call SWAP
	add esi, 4
	add edi, 4
	loop swapLoop
	
	mov edx, offset str3
	call writestring
	call crlf

	mov esi, offset A
	mov ecx, lengthof A

printA:
	mov eax, [esi]
	call writeint
	call crlf
	add esi, 4
	loop printA

	mov edx, offset str4
	call writestring
	call crlf

	mov edi, offset B
	mov ecx, lengthof B

printB:
	mov eax, [edi]
	call writeint
	call crlf
	add edi, 4
	loop printB

	exit
main ENDP

; ---------------------------------------------------------------
SWAP PROC
;
;	SWAP the values [ESI] and [EDI] if [ESI] > [EDI]
;	Inputs: ESI, EDI
;	Returns: nothing
;	Requires: nothing
; ---------------------------------------------------------------
	
	mov eax, [esi]
	cmp eax, [edi]
	jle noSwap

	mov ebx, [esi]
	mov eax, [edi]
	mov [edi], ebx
	mov [esi], eax

noSwap:
	ret
SWAP ENDP
END main