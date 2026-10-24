;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc

.code
main PROC
; 1. PUSH: Guardar valores individuales en la pila (Stack)
mov eax, 10
mov ebx, 20
mov ecx, 30

push eax ; Apila el valor de EAX (10) en la pila
push ebx ; Apila el valor de EBX (20) encima de EAX
push ecx ; Apila el valor de ECX (30) en el tope de la pila

nop 

; 2. POP: Recuperar valores de la pila (LIFO: Ultimo en entrar, primero en salir)
pop eax ; Extrae el ultimo valor apilado (30) y lo guarda en EAX
pop ebx ; Extrae el siguiente valor (20) y lo guarda en EBX
pop ecx ; Extrae el primer valor apilado (10) y lo guarda en ECX

nop ; Punto de pausa: Ahora EAX=30, EBX=20 y ECX=10 (los valores se invirtieron)

; 3. PUSHAD y POPAD: Guardar y recuperar TODOS los registros generales a la vez
mov eax, 100
mov ebx, 200

pushad ; Apila el estado actual de todos los registros generales (EAX, EBX, ECX, EDX, etc.)

mov eax, 0 
mov ebx, 0 

popad ; Restaura todos los registros a los valores que tenian al momento del pushad

nop ; Punto de pausa: EAX vuelve a ser 100 y EBX vuelve a ser 200

; 4. PUSHFD y POPFD: Guardar y recuperar las banderas (EFLAGS)
pushfd ; Apila el estado actual del registro de banderas (EFLAGS)

popfd ; Extrae y restaura las banderas a como estaban antes de hacer algun CMP, ADD, etc.

nop

exit
main ENDP

END main