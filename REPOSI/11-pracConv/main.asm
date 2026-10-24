;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
	bytesDesc DWORD ?
	bytesPend DWORD ?
	gruposComp DWORD ?
	porcentaje DWORD ?
	residuo DWORD ?
	bufferASCII BYTE 11 DUP(0)


.code
main PROC
	mov eax, 125
	mov ebx, 512
	mul ebx
	mov bytesDesc, eax
	
	mov esi, OFFSET bufferASCII  
	call convertirDecimal
	mov edx, OFFSET bufferASCII  
	call WriteString
	call Crlf

	mov eax, 100000
	sub eax, bytesDesc
	mov bytesPend, eax
	
	mov eax, bytesPend
	mov esi, OFFSET bufferASCII
	call convertirDecimal
	mov edx, OFFSET bufferASCII
	call WriteString
	call Crlf



	mov eax, bytesDesc
	mov ebx, 100
	mul ebx
	mov ebx, 100000
	mov edx, 0
	div ebx
	mov porcentaje, eax
	
	mov esi, OFFSET bufferASCII
	call convertirDecimal
	mov edx, OFFSET bufferASCII
	call WriteString
	call Crlf

	mov eax, bytesDesc
	mov ebx, 1024
	mov edx, 0
	div ebx
	mov gruposComp, eax
	mov residuo, edx

	mov esi, OFFSET bufferASCII
	call convertirDecimal
	mov edx, OFFSET bufferASCII
	call WriteString 
	call Crlf

	mov eax, residuo
	mov esi, OFFSET bufferASCII
	call convertirDecimal
	mov edx, OFFSET bufferASCII
	call WriteString
	call Crlf

	exit 
main ENDP

convertirDecimal PROC
	mov ecx, 0
	mov ebx, 10

	convertirLoop:
	mov edx, 0
	div ebx
	push edx
	inc ecx

	cmp eax, 0
	jne convertirLoop

	cadenaLoop:
		pop edx
		add dl, '0'
		mov [esi], dl
		inc esi
		loop cadenaLoop
		mov byte ptr [esi], 0

		ret
	convertirDecimal ENDP

END main
