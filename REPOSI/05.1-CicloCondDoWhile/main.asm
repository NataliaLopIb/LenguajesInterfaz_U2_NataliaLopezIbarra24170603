;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
    mensaje BYTE "Escriba un numero (0 para salir): ", 0
    despedida BYTE "Programa terminado.", 0

.code
main PROC

    ciclo:
        ; Mostrar el mensaje en pantalla
        mov edx, OFFSET mensaje
        call WriteString
        
        ; Leer el número ingresado por el usuario (se guarda automáticamente en EAX)
        call ReadDec
        
        ; Comparar el valor ingresado con 0
        cmp eax, 0
        je fin_ciclo      ; Jump if Equal: Si EAX == 0, salta a la etiqueta 'fin_ciclo'
        
        call Crlf
        jmp ciclo      

    fin_ciclo:
        ; Mensaje de salida
        call Crlf
        mov edx, OFFSET despedida
        call WriteString
        call Crlf
        
        exit

main ENDP
END main