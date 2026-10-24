;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
    valor     DWORD 12AB34CDh
    cadenaHex BYTE  9 DUP(0); 8 caracteres + 1 byte nulo de terminación (0)
    msgOriginal BYTE "Numero original (Hex): ", 0
    msgCadena   BYTE "Cadena de texto (ASCII): ", 0

.code
main PROC
    call Clrscr

    ; Mostramos el mensaje inicial
    mov edx, OFFSET msgOriginal
    call WriteString
    mov eax, valor
    call WriteHex
    call Crlf

    ; Preparación para la conversión
    mov eax, valor ; EAX tiene el valor entero 12AB34CDh
    mov esi, OFFSET cadenaHex ; ESI apunta al búfer de salida
    mov ecx, 8 ; 8 nibbles a procesar (32 bits / 4 bits)

convertir_loop:
    ROL eax, 4 ; Rotamos 4 bits a la izquierda para traer el nibble mas significativo a los 4 bits bajos
    mov dl, al ; Copiamos AL a DL
    and dl, 0Fh; Aislamos los últimos 4 bits (nibble)

    cmp dl, 9 ; Comparar el nibble con 9
    jbe es_numero ; Si DL <= 9, jump below or equal

    ; Es una letra (10 a 15 -> 'A' a 'F')
    add dl, 37h ; 10 + 37h = 41h ('A')
    jmp guardar

es_numero:
    ; Es un dígito (0 a 9 -> '0' a '9')
    add dl, 30h ; 0 + 30h = 30h ('0')

guardar:
    mov [esi], dl ; Guardamos el carácter ASCII en el búfer
    inc esi ; Avanzamos al siguiente byte de la cadena
    loop convertir_loop ; Decrementa ECX y repite si ECX > 0

    ; Terminador nulo para que WriteString sepa dónde acaba la cadena
    mov byte ptr [esi], 0

    ; Mostramos el resultado como cadena de texto ASCII
    mov edx, OFFSET msgCadena
    call WriteString
    
    mov edx, OFFSET cadenaHex ; Imprimir la cadena convertida
    call WriteString
    call Crlf

    exit
main ENDP

END main
