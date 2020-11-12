# Authors: Mauricio Dur�n, Ivan Iturbe

# Tower1 start at: 0x10010000   Tower2 start at: 0x10010040, Tower3 start at: 0x10010080
 Main:
 	addi $s0, $zero, 3 # Carga n
 	lui $at, 0x1001 # Carga de parte alta de direcci�n
 	ori $s1, $at, 0 # Carga de dir de inicio de Torre1 a $s1
 	sll $t0, $s0, 2 #offset s0 = n    n*4 =  00 - 04 - 08 -> 0c     n=3  => 3*4 = 12 = 0c         <<2 = *4     currentAddress + 4*n =    
 	add $s2, $s1, $t0 # tower1 + offset where offset (4*n)
	add $s3, $s2, $t0 # tower2 + offset where offset (4*n)
 	#ori $s2, $at, 0x40 # Carga de dir de inicio de Torre2 a $s2
 	#ori $s3, $at, 0x80 # Carga de dir de inicio de Torre3 a $s3
	jal Fill_Tower_With_Disks
	
	add $a0, $zero, $s1
	add $a1, $zero, $s3
	add $a2, $zero, $s2
	add $a3, $zero, $s0
	
	jal Solve_Hanoi_Tower
	j exit
	
MoveDisk: #a0 = fromTower, a1 = destTower
	addi $a0,$a0, -4 #Se actualizan direcciones a las que deben apuntar los punteros. 
	lw $t2, 0($a0) #Se lee la posici�n anterior de la Torre de origen
	sw $t2, 0($a1) #Se escribe en la posici�n actial de la torre destino
	sw $zero, 0($a0) #Se borra valor de la torre origen.
	addi $a1, $a1, 4 
	jr $ra
	
Solve_Hanoi_Tower: #a0 = fromTower, a1 = destTower, a2 = tempTower, a3 = n
	bne $a3, $zero, Recursion_Loop # mientras a3 > 0 Recursion_Loop
	jr $ra
Recursion_Loop:	
	#Guardado de argumentos a0 = fromTower, a1 = destTower, 
	#a2 = tempTower, a3 = n y ra en stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	addi $a3, $a3, -1 #decremento de n
	add $t0, $zero, $a1 # temp <- a1 (intercambio a1 y a2)
	add $a1, $zero, $a2 # a1 <- a2
	add $a2, $zero, $t0 # a2 <- temp

	jal Solve_Hanoi_Tower
	
	#regresamos los valores previos a la llamada recursiva
	add $t0, $zero, $a1 # temp <- a1 (intercambio a1 y a2)
	add $a1, $zero, $a2 # a1 <- a2
	add $a2, $zero, $t0 # a2 <- temp

	jal MoveDisk

 	#intercambio $a0 y $a2 
	add $t0, $zero, $a0
	add $a0, $zero, $a2
	add $a2, $zero, $t0
	
	jal Solve_Hanoi_Tower
	
	#Regresamos a valores previos
	add $t0, $zero, $a0
	add $a0, $zero, $a2
	add $a2, $zero, $t0
	addi $a3, $a3, 1
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	
	
Fill_Tower_With_Disks:
	#Iterador iniciado en n 
	add, $t0, $zero, $s0
	#Asignaci�n de suma para direcci�n. Se inicia en cero para el primer elemento 
 	
Fill_Tower_Loop:
	sw $t0, 0($s1) #Guardar valor de $t0= n->1 en memoria
	add $s1, $s1, 4 #Se mueve apuntador de Tower1 a la posici�n requerida 
	addi $t0, $t0, -1 #Se reduce en uno valor de iterador
	#Si iterador es mayor de uno se vuelve al forLoop
	bne $t0, $zero Fill_Tower_Loop
	jr $ra
	
exit:
	nop
