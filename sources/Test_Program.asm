
	.text
	addi $s0, $zero, 0
	bne $s0, $zero, JUMP
	addi $s1, $zero, 1
	add $s1, $s1, 2
	add $s1, $s1, 2
	add $s1, $s1, 1
JUMP:
	addi $s1, $zero, 14
	
