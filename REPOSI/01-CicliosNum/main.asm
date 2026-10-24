;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data 
	
.code
main PROC
	mov ecx, 5  ; Establece el contador del ciclo en 5 iteraciones
	je fin_ciclo ; Salta a 'fin_ciclo' si ECX es 0 (previene un ciclo infinito si el contador inicia en 0)

ciclo:
	mov eax, ecx ; Copia el valor actual del contador (ECX) a EAX para poder imprimirlo
	call WriteDec; Imprime en consola el número decimal sin signo almacenado en EAX
	call Crlf  ; Imprime un carácter de salto de línea y retorno de carro (Enter)
	
	loop ciclo ; Decrementa ECX automáticamente y salta a 'ciclo' si ECX es mayor a 0

fin_ciclo:
	exit
main ENDP

END main