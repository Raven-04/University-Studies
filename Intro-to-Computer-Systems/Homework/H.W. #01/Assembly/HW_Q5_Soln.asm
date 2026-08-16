TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	array WORD 1050, 1450, 1300, 2010, 1750
	str1 BYTE "The total sales is: ", 0

.code
main PROC
	mov edx, OFFSET str1
	call WriteString

	mov eax, 0

	; summation of the array's values (direct-offset)
	add ax, array
	add ax, array+2
	add ax, array+4
	add ax, array+6
	add ax, array+8

	call WriteInt

	exit
main ENDP
END main