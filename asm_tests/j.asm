.text

addi $s2, $zero, 0

j test #saltar incondicional a test
addi $s2, $s2, 1
addi $s2, $s2, 2
addi $s2, $s2, 3
addi $s2, $s2, 4

test:
addi $s2, $s2, 1  #si j funciona, s2 = 1 y todos los addi superiores no seran ejecutados
