TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	array WORD 1050,1450,1300,2010,1750
	len_array = ($ - array)/2
	str1 BYTE "The total sales is: ", 0

.code
main PROC
	mov edx, OFFSET str1
	call WriteString
	
	; ebx points to the array and ecx has the size of the array
	mov eax, 0
	mov ebx, OFFSET array
	mov ecx, len_array

	mov ax, 0

	; summation of the array's elements (indirect operand)
again:
	add ax, [ebx]
	add ebx, 2
	loop again
	
	call WriteInt

	exit
main ENDP
END main