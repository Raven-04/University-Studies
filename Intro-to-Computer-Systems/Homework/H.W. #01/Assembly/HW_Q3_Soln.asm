TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	str1 BYTE "Please enter the value of n: ", 0
	str2 BYTE "The value of A is: ", 0
	mult DWORD 3
	sum DWORD 0

.code
main PROC
	mov edx, OFFSET str1
	call WriteString

	; reading input from user
	call ReadInt
	mov ecx, eax

	; calculation of the equation
again:
	mov eax, mult
	sub eax, 5
	add sum, eax
	add mult, 3
	loop again

	; outputing the sum of the calculated equation
	call crlf
	mov edx, OFFSET str2
	call WriteString
	mov eax, sum
	call WriteInt

	exit
main ENDP
END main