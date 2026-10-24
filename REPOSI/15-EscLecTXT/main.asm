;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc
;Leguajes de Interfaz/Natalia Lopez Ibarra/9-10/Docente
;ReadFromFile: CF se va activar si no se puede abrir el archivo
;para mostrar lo que leimos se agrega 00h y se utiliza WriteString
;CloseFile: CF se va activar si no se puede cerrar el archivo
;Exito = EAX distinto de 0
;Guardar -> crear archivo/ escribir 125/ cerrar -> inventario.txt (125)
;Recuperar -> abrir archivo/ leer buffer/ cerrar -> inventario.txt (125)
;comprobar cada operacion
.data
	nombreArchivo BYTE "inventario.txt",0
	texto BYTE "125", 0
	archivoHandle DWORD ?
	mensajeExito BYTE "Archivo creado y escrito con exito", 0
	mensajeError BYTE "Error al crear o escribir el archivo", 0

.code
main PROC 
	; 1. Crear el archivo
	mov edx, OFFSET nombreArchivo
	call createOutPutFile
	cmp eax, INVALID_HANDLE_VALUE
	je error

	mov archivoHandle, eax ; Guardar el handle del archivo

	; 2. Escribir en el archivo
	;saber que, cuanto y donde escribir
	;handle del archivo, buffer, numero de bytes a escribir, variable para guardar el numero de bytes escritos
	;ecx es el tamano del buffer, que es 3 bytes (los caracteres '1', '2', '5')
	mov eax, archivoHandle
	mov edx, OFFSET texto
	mov ecx, SIZEOF texto
	call WriteToFile 

	jc errorEscritura

	cmp eax, SIZEOFF texto -1 
	jne error

	; 3. cerrar el archivo
	mov eax, archivoHandle
	call CloseFile
	test eax, eax
	jz error

	mov edx, OFFSET mensajeExito
	call WriteString
	jmp fin

	errorEscritura:
		mov eax, archivoHandle
		call CloseFile
		exit

	error:
		mov edx, OFFSET mensajeError
		call WriteString 

	exit

main ENDP

END main
