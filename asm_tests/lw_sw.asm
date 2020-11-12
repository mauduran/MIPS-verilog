.text
lui $s0, 1001
ori $s0, 4

addi $s1, $zero, 6 # Valor a guardar en memoria

sw $s1, 0($s0) #Escribir s1 en el segundo espacio de memoria (10010004)
lw $s3, 0($s0) #Leer el dato recien escrito
