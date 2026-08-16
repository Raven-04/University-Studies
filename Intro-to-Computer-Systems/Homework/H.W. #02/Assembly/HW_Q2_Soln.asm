TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	str1 byte "Enter a decimal number: ", 0
	str2 byte "The sum of even numbers is: ", 0
	str3 byte "The product of odd numbers is: ", 0
	str4 byte "The number of prime numbers is: ", 0
	A dword 10 DUP(?)
	SUM dword 0
	PROD dword 1
	COUNT dword 0

.code
main PROC
	mov edx, offset str1

	mov esi, offset A
	mov ecx, lengthof A

first:
	call writestring
	call readint
	mov [esi], eax
	add esi, 4
	loop first

	mov esi, offset A
	mov ecx, lengthof A

second:
	mov eax, [esi]
	test eax, 1
	jz evenNum

	mul PROD
	mov PROD, eax
	jmp repeatLoop

evenNum:
	add SUM, eax

repeatLoop:
	add esi, 4
	loop second

	mov edx, offset str2
	call writestring
	mov eax, SUM
	call writeint
	call crlf

	mov edx, offset str3
	call writestring
	mov eax, PROD
	call writeint
	call crlf

	mov PROD, 1
	mov esi, offset A
	mov ecx, lengthof A

checkPrime:
	mov eax, [esi]

	test eax, 1
	jz continue

	mul PROD
	mov PROD, eax
	ror PROD, 1
	
continue:
	mov edx, eax
	cmp edx, 1
	jbe notPrime

	and edx, 1
	jz notPrime

	mov ecx, 3

sqrtLoop:
	mov eax, edx
	div ecx
	cmp edx, 0
	jz notPrime
	inc ecx
	cmp ecx, edx
	jge primeFound
	jmp sqrtLoop

notPrime:
	jmp continueLoop

primeFound:
	inc COUNT

continueLoop:
	add esi, 4
	loop checkPrime

	mov edx, offset str4
	call writestring
	mov eax, COUNT
	call writeint
	call crlf

	exit
main ENDP
END main