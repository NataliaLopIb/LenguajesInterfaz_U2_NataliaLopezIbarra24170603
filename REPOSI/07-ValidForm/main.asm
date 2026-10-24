;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data 
msgInicio BYTE "Ingresa el msj con el siguiente formato (TEC-123): ",0
cadena BYTE 20 DUP(0) 
msgError BYTE "Tu cadena no es valida, utiliza el formato correcto ",0
msgValido BYTE "Formato valido",0

.code
main PROC

pedirtexto:
mov edx, OFFSET msgInicio
call WriteString

mov edx, OFFSET cadena 
mov ecx, SIZEOF cadena 

call ReadString ; Lee la cadena ingresada por el usuario

cmp eax, 7 ; Compara si la longitud de la cadena es exactamente de 7 caracteres
jne error ; Salta a error si la longitud no es igual a 7

mov esi,0

validarL:
cmp ESI,3
je guion
mov AL, cadena[ESI]
cmp AL, 'A' ; Verifica si el caracter es menor a la letra 'A' mayúscula
jb error ; Salta a error si está por debajo del rango de letras válidas
cmp AL, 'Z' ; Verifica si el caracter es mayor a la letra 'Z' mayúscula
ja error ; Salta a error si excede el rango de letras válidas

inc esi
jmp validarL

guion:
cmp cadena[3], '-' ; Verifica si el cuarto caracter es exactamente un guion
jne error ; Salta a error si el caracter es diferente a un guion

mov esi,4

digitos:
cmp esi,7
je valido

mov al, cadena[esi]
cmp al, '0' ; Verifica si el caracter es menor al número '0'
jb error ; Salta a error si está por debajo del rango de números
cmp al, '9' ; Verifica si el caracter es mayor al número '9'
ja error ; Salta a error si excede el rango de números

inc esi
jmp digitos

error:
mov edx, OFFSET msgError
call WriteString
call Crlf
jmp pedirtexto

valido:
mov edx, OFFSET msgValido
call WriteString

exit 
main ENDP

END main