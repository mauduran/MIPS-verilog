.text

addi $s2, $zero, 0

jal test #saltar incondicional a test
addi $s2, $s2, 3 #despues del jal, jr debe volver a esta instruccion
nop 
nop
nop
nop
nop


test:
addi $s2, $s2, 1  #si j funciona, s2 = 1 y todos los addi superiores no seran ejecutados

jr $ra