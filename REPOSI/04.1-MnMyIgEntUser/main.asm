;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc
.data
.code
main PROC
    mov eax, 5 
    
    jmp continuar 
    mov eax, 10 ; Nunca se ejecuta por el salto anterior

continuar: 
    call DumpRegs ; Imprime en pantalla el estado actual de los registros

    exit      
main ENDP

END main
