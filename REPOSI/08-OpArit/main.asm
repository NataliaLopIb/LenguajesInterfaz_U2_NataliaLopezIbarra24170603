;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
	; Nombres válidos empezando con letra y usando DWORD para variables de 32 bits
	var1 DWORD 0
	var2 DWORD 0
	var3 DWORD 0

.code
main PROC 
;01 -ADD y SUB : Operaciones Suma y Resta
	mov eax, 50
	mov ebx, 20

	add eax, ebx ; Suma
	sub eax, 15  ; Resta

	nop ; No operation

;03 OF: Desbordamiento en una suma con signo
	mov eax, 0
	mov al, 127
	add al, 1    ; Desbordamiento (se eliminó la coma extra después del add)

	nop 

;04: mul: dentro de 32 bits
	mov eax, 10
	mov ebx, 5
	mul ebx      ; Multiplicación

	nop

;05: mul: fuera de 32 bits
	mov eax, 0FFFFFFFFh


	
;06 IMUL producto sin signoI
	mov eax, -5

	imul eax, eax, 3

	nop 

; 07 DIV dividendo valores pequenios sin signo

	mov eax, 125
	mov ebx, 0
	mov ebx, 12

	div ebx

	nop

	; IDIV Y CDQ: Division con signo
	mov eax, -125
	cdq ; para volver los numeros en negativo en los registros
	mov ebx, 12
	idiv ebx
	call DumpRegs
	exit
	


main ENDP

END main
