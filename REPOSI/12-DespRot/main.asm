;Lenguajes de Interfaz, Natalia Lopez Ibarra, 9-10, Jose Luis Medina Jimenez
INCLUDE Irvine32.inc
;Desplazamiento de bits a la izquierda y a la derecha
;SHL mueve los bits hacia pocisiones de mayor peso y coloca 0 en las por la izq. 
;desplaza valores interpretados sin signo
;CF va actuar como el primer bit que se desplaza fuera del registro

;SAR desplaza hacia la derecha y replica el bit del signo en las pocisiones libres.
;1 en la 7ma posicion de un byte indica que el valor es negativo, 0 indica que es positivo

;como indicar cuantas pocisiones se van a desplazar
;conteo consntante: SHL registro, n
;
;hacia la derecha se multiplica por 2^n, hacia la izquierda se divide por 2^n

;Rotacion: los bits que se desplazan fuera del registro se colocan en el otro extremo del registro
;ROR y ROL rotan a la derecha y a la izquierda respectivamente, el bit de acarreo se coloca en el otro extremo del registro
;RCL y RCR rotan igual pero utilizan el CF
;CF se comporta como un bit adicional que se desplaza junto con los bits del registro

.data
	

.code
main PROC 
	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, 0

;01 - SHL: Dezplazamiento de bits a la izquierda
	mov al, 10000110b
	shl al, 1

	
;02- SHR: Desplazamiento de bits a la derecha ;PF paridad de bits
	mov al, 00001101b
	shr al, 1



;03 - SAR: Desplazamiento con signo
	mov eax, 0
	mov al, -8
	sar al, 1

;04 - SAR: Desplazamiento con valor impar
	mov eax, 0
	mov al, -9
	sar al, 1

;05 - Conteo constante: desplazar 2 pocisiones 
	mov al, 00001100b
	shl al, 2

;06 - Conteo con CL: Desplazar utilizando registro
	mov al, 00001100b
	mov cl, 2
	shl al, cl

;07 - Rotacion: ROL y ROR
	mov al, 10001100b
	rol al, 1

	call DumpRegs
	call Crlf
	call WriteBin

	mov al, 00001100b
	ror al, 1

	call DumpRegs
	call Crlf
	call WriteBin



	




main ENDP

END main
