	.text
	addi $s2, $zero, 0
	beq  $s2, $zero, JUMP
	addi $s1, $zero, 1
JUMP:
	addi $s1, $zero, 2
