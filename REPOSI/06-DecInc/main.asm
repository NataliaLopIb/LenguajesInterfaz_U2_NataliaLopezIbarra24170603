;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data 
msgPIN BYTE "Ingrese la clave: ",0
msgError BYTE "Clave Incorrecta.",0
msgAcceso BYTE "Acceso permitido",0
msgBloqueo BYTE "Sistema Bloqueado",0
msgIntentos BYTE "Intentos restantes: ",0

claveCorrecta = 1234

.code
main PROC
mov ebx, 3 
intentar:
mov edx, OFFSET msgPIN
call WriteString 
call ReadInt 

cmp eax, claveCorrecta 

je acceso 

mov edx, OFFSET msgError 
call WriteString
call crlf

dec ebx ; Resta 1 al contador de intentos

jz bloqueado

mov edx, OFFSET msgIntentos
call WriteString

mov eax, ebx
call WriteDec
call crlf

jmp intentar
acceso:
mov edx, OFFSET msgAcceso
call WriteString
jmp fin

bloqueado:
mov edx, OFFSET msgBloqueo
call WriteString
jmp fin
fin:
exit 
main ENDP

END main