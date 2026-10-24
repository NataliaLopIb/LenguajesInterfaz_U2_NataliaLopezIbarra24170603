;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc
;0 - computadora encendida 0: No 1 : si
;1 - Alarma 
;2 - computadora esta conectada 
;Condiciones iniciales: 0000 0101
.data

encendida DB "Alarma encendida", 0
apagada DB "Alarma apagada", 0
	

.code
main PROC 
; AND: Evaluacion de alarma
	mov al, 00000111b
	and al, 00000111b
	;call WriteBin ;apunta directamente al registro de eax

;2- OR : Encender alarma
	mov eax, 0
	mov al, 00000101b
	or al, 00000010b



;3 - XOR: apagar computadora y encenderla 
; estado inicial : 0000 0101
	mov eax, 0
	mov al, 00000101b ; estado inical
	xor al, 00000001b ; apagar computadora 
	call WriteBin

	xor al, 00000001b ; encender computadora
	call Crlf
	call WriteBin



;4 - TEST: Evaluar alarma encendida y apagada
; Realizar salto y mostrar mensaje de: Alarma encendida o apagada
	mov eax, 0
	mov al, 00000111b ; estado inical
	test al, 00000010b ; evaluar alarma
	jz ebx, 0
	jz AlarmaApagada
	jz AlarmaEncendida

AlarmaApagada:
	mov edx, OFFSET apagada
	call Crlf
	call WriteString
	jmp Fin

AlarmaEncendida:
	mov edx, OFFSET encendida
	call Crlf
	call WriteString

Fin:
main ENDP



END main
