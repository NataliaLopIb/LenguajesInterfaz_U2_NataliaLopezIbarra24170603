;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
msg1 BYTE "Cantidad de espacios del estacionamiento: ", 0
msg2 BYTE "Ingrese 1 para estacionar un auto: ", 0
msg3 BYTE "Espacios disponibles: ", 0
msg4 BYTE "Estacionamiento lleno, no se pueden estacionar mas autos", 0
espacios DWORD ?
estacionar DWORD ?

.code
main PROC
mov edx, OFFSET msg1 
call WriteString 
call ReadInt ; Lee la cantidad de espacios iniciales ingresada por el usuario
mov espacios, eax 

ciclo:
cmp espacios, 0 ; Verifica si los espacios llegaron a cero
je lleno ; Salta si es igual a cero (estacionamiento lleno)

mov edx, OFFSET msg2 
call WriteString 
call ReadInt ; Lee la opción del usuario para estacionar
mov estacionar, eax 

cmp estacionar, 1 ; Revisa si el usuario ingresó exactamente el número 1
jne ciclo ; Si no es igual a 1, ignora la entrada y repite el ciclo

dec espacios ; Resta 1 a la variable de espacios disponibles

mov edx, OFFSET msg3 
call WriteString 
mov eax, espacios 
call WriteDec 
call Crlf 

jmp ciclo 

lleno:
mov edx, OFFSET msg4 
call WriteString 
call Crlf 
exit 

main ENDP
END main