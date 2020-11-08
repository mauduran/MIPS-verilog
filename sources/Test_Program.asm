
	.text
	lui $s0, 0x1001
	ori $s0, $s0, 0x0000
	addi $s2, $s2, 3
	sw $s2, 0($s0)
	lw $s3, 4($s0)
	
