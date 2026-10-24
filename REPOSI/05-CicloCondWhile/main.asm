;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.code
main PROC
	mov ebx, 1 ;valor inicial de ebx

	ciclo:
	 cmp ebx, 100 ;hasta donde quieres que llegue el bucle


	jg fin ;salto a fin si ebx es mayor que 100


	mov eax, ebx
	call WriteDec ;Se escribe el valor de ebx en consola
	call Crlf
	inc ebx ; inc incremento es de 1

	jmp ciclo ;repite el ciclo tantas veces se cumpla la condición

	fin:
	 exit

main ENDP

END main

