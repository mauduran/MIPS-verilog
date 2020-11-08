
	.text
	lui $s0, 0x1001
	ori $s0, $s0, 0x0000
	addi $s2, $zero, 3
	addi $s1, $zero, 2
	addi $s3, $zero, 1
	sw $s2, 0($s0)
	sw $s1, 4($s0)
	sw $s3, 8($s0)
	lw $s3, 4($s0)
	
