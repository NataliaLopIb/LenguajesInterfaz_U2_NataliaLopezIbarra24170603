;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.data
    msgIguales BYTE "Los numeros son iguales", 0
    msgDiferentes BYTE "Los numeros son diferentes", 0

.code
main PROC

    mov eax, 180
    mov ebx, 181

    cmp eax, ebx ; Compara EAX y EBX (realiza EAX - EBX internamente) y actualiza las banderas de estado (Flags) sin alterar los registros

    je iguales ; Jump if Equal: Salta a la etiqueta 'iguales' si la bandera de cero ZF se activó en la comparación previa
    
    ; Bloque ejecutado si la condición 'je' no entra
    mov edx, OFFSET msgDiferentes ; Apunta EDX a la dirección de memoria donde inicia la cadena de números diferentes
    call WriteString 

    jmp fin 

iguales: 
    mov edx, OFFSET msgIguales  
    call WriteString 

fin: 
    exit 

main ENDP

END main