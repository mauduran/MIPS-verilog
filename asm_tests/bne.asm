.text
addi $s0, $zero, 6
addi $s1, $zero, 8

addi $s2, $zero, 0

bne $s0, $s1, test #saltar a test ya que s0 y s1 no son iguales
addi $s2, $s2, 1
addi $s2, $s2, 2
addi $s2, $s2, 3
addi $s2, $s2, 4

test:
addi $s2, $s2, 1  #como s0 y s1 no son iguales el valor final de s2 debe ser 1 por el salto