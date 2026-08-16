TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	MAX = 10
	string1 BYTE MAX+1 DUP (?)
	string2 BYTE "Please enter the input string: ", 0
	string3 BYTE "The modified string is: ", 0

.code
main PROC
	mov edx, OFFSET string2
	call WriteString

	; reading input from user
	mov edx, OFFSET string1
	mov ecx, MAX
	call ReadString

	; 3 iterations and esi points to string1
	mov ecx, 3
	mov esi, OFFSET string1

	; capitalizing the first 3 characters
again:
	mov al, [esi]
	sub al, 32
	mov [esi], al
	inc esi

	loop again
	
	call crlf
	
	; outputing the the modified (first 3 characters are capitalized)
	mov edx, OFFSET string3
	call WriteString
	mov edx, OFFSET string1
	call WriteString

	exit
main ENDP
END main