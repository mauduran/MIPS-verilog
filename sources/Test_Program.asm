
	.text
	lui $s0, 0x1001
	ori $s0, $s0, 0x0000
	
	addi $s1, $zero, 2
	sw $s1, 0($s0)
	
