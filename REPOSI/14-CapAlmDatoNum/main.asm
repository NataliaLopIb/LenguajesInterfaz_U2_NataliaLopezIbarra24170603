;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
cantidadInicial DWORD 25
cantidadRecibida DWORD ?
existenciaActual DWORD ?
recepcion BYTE "Ingrese una cantidad (1-99): ",0
msgError BYTE "Cantidad recibida invalida",0
msg1 BYTE "Existencia inicial ",0
msg2 BYTE " + recepcion de ",0
msg3 BYTE " existencia actual ",0
msg4 BYTE " unidades",0
cadena BYTE 10 DUP(0)
buffer BYTE 3 DUP(0)

.code
main PROC

capturar:
mov edx, OFFSET recepcion 
call WriteString 

mov edx, OFFSET buffer ; Prepara el buffer de memoria para la lectura
mov ecx, SIZEOF buffer 
call ReadString ; Captura los caracteres tecleados por el usuario

cmp eax, 0 
je error 

cmp eax, 2 
ja error 

mov bl, buffer[0] 

cmp bl, '0' 
jb error

cmp bl, '9' 
ja error

cmp eax, 1
je unDigito 

mov bl, buffer[1] 

cmp bl, '0' 
jb error

cmp bl, '9' 
ja error

movzx eax, buffer[0] 
sub eax, '0' ; Convierte el primer caracter ASCII a valor decimal

mov ebx, 10 
mul ebx 

movzx ebx, buffer[1] 
sub ebx, '0' ; Convierte el segundo caracter ASCII a valor decimal

add eax, ebx ; Suma para formar el dato numerico completo de dos digitos
jmp validarRango

unDigito:
movzx eax, buffer[0] 
sub eax, '0' ; Convierte a decimal en caso de ser un solo caracter

validarRango:
cmp eax, 1 
jb error

cmp eax, 99 
ja error

mov cantidadRecibida, eax ; Almacena de forma definitiva el numero ingresado
mov eax, cantidadInicial 
add eax, cantidadRecibida 
mov existenciaActual, eax ; Almacena el resultado final en memoria

mov edx, OFFSET msg1
call WriteString

mov eax, cantidadInicial
mov esi, OFFSET cadena
call convertirDecimal 

mov edx, OFFSET cadena
call WriteString

mov edx, OFFSET msg2
call WriteString

mov eax, cantidadRecibida
mov esi, OFFSET cadena
call convertirDecimal

mov edx, OFFSET cadena
call WriteString

mov edx, OFFSET msg3
call WriteString

mov eax, existenciaActual
mov esi, OFFSET cadena
call convertirDecimal

mov edx, OFFSET cadena
call WriteString

mov edx, OFFSET msg4
call WriteString

call Crlf 
exit 
error:
mov edx, OFFSET msgError 
call WriteString 
call Crlf 
jmp capturar 
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

mov BYTE PTR [esi], 0 

ret 
convertirDecimal ENDP

END main