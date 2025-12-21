	.file	1 "test.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,160,$31		# vars= 96, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$31,156($sp)
	sw	$fp,152($sp)
	sw	$23,148($sp)
	sw	$22,144($sp)
	sw	$21,140($sp)
	sw	$20,136($sp)
	sw	$19,132($sp)
	sw	$18,128($sp)
	sw	$17,124($sp)
	sw	$16,120($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,116($fp)
	move	$2,$sp
	sw	$2,28($fp)
	li	$2,60			# 0x3c
	sw	$2,88($fp)
	lw	$2,88($fp)
	addiu	$2,$2,-1
	sw	$2,84($fp)
	lw	$2,88($fp)
	move	$7,$2
	move	$6,$0
	srl	$2,$7,27
	sll	$4,$6,5
	or	$4,$2,$4
	sll	$5,$7,5
	lw	$2,88($fp)
	sw	$2,68($fp)
	sw	$0,64($fp)
	lw	$5,68($fp)
	lw	$4,64($fp)
	move	$2,$5
	srl	$2,$2,27
	move	$3,$4
	sll	$18,$3,5
	or	$18,$2,$18
	move	$2,$5
	sll	$19,$2,5
	lw	$2,88($fp)
	sll	$2,$2,2
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,80($fp)
	lw	$2,88($fp)
	addiu	$2,$2,-1
	sw	$2,76($fp)
	lw	$2,88($fp)
	sw	$2,60($fp)
	sw	$0,56($fp)
	lw	$5,60($fp)
	lw	$4,56($fp)
	move	$2,$5
	srl	$2,$2,27
	move	$3,$4
	sll	$16,$3,5
	or	$16,$2,$16
	move	$2,$5
	sll	$17,$2,5
	lw	$2,88($fp)
	sw	$2,52($fp)
	sw	$0,48($fp)
	lw	$5,52($fp)
	lw	$4,48($fp)
	move	$2,$5
	srl	$2,$2,27
	move	$3,$4
	sll	$24,$3,5
	or	$24,$2,$24
	move	$2,$5
	sll	$25,$2,5
	lw	$2,88($fp)
	sll	$2,$2,2
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,96($fp)
	lw	$2,88($fp)
	addiu	$2,$2,-1
	sw	$2,100($fp)
	lw	$2,88($fp)
	sw	$2,44($fp)
	sw	$0,40($fp)
	lw	$5,44($fp)
	lw	$4,40($fp)
	move	$2,$5
	srl	$2,$2,27
	move	$3,$4
	sll	$14,$3,5
	or	$14,$2,$14
	move	$2,$5
	sll	$15,$2,5
	lw	$2,88($fp)
	sw	$2,36($fp)
	sw	$0,32($fp)
	lw	$5,36($fp)
	lw	$4,32($fp)
	move	$2,$5
	srl	$2,$2,27
	move	$3,$4
	sll	$12,$3,5
	or	$12,$2,$12
	move	$2,$5
	sll	$13,$2,5
	lw	$2,88($fp)
	sll	$2,$2,2
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,104($fp)
	lw	$2,88($fp)
	addiu	$2,$2,-1
	sw	$2,108($fp)
	lw	$2,88($fp)
	move	$23,$2
	move	$22,$0
	srl	$2,$23,27
	sll	$10,$22,5
	or	$10,$2,$10
	sll	$11,$23,5
	lw	$2,88($fp)
	move	$21,$2
	move	$20,$0
	srl	$2,$21,27
	sll	$8,$20,5
	or	$8,$2,$8
	sll	$9,$21,5
	lw	$2,88($fp)
	sll	$2,$2,2
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,112($fp)
	lw	$2,80($fp)
	sw	$0,0($2)
	lw	$2,96($fp)
	li	$3,1			# 0x1
	sw	$3,0($2)
	sw	$0,92($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L7:
	lw	$2,92($fp)
	blez	$2,$L3
	nop

	lw	$2,92($fp)
	addiu	$2,$2,-1
	lw	$3,80($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,92($fp)
	addu	$3,$3,$2
	lw	$4,80($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,92($fp)
	addiu	$2,$2,-1
	lw	$3,96($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$4,0($2)
	lw	$3,92($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	addu	$3,$4,$2
	lw	$4,96($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
$L3:
	lw	$2,92($fp)
	slt	$2,$2,20
	beq	$2,$0,$L4
	nop

	lw	$3,80($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,104($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$3,96($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,112($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	.option	pic0
	b	$L5
	nop

	.option	pic2
$L4:
	lw	$2,92($fp)
	slt	$2,$2,40
	beq	$2,$0,$L6
	nop

	lw	$3,80($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,96($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	addu	$3,$3,$2
	lw	$4,104($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$3,80($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,104($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	mul	$3,$3,$2
	lw	$4,112($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	.option	pic0
	b	$L5
	nop

	.option	pic2
$L6:
	lw	$3,80($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,96($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	mul	$3,$3,$2
	lw	$4,104($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$3,104($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,96($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	mul	$3,$3,$2
	lw	$4,112($fp)
	lw	$2,92($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
$L5:
	lw	$2,92($fp)
	addiu	$2,$2,1
	sw	$2,92($fp)
$L2:
	lw	$3,92($fp)
	lw	$2,88($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L7
	nop

	move	$2,$0
	lw	$sp,28($fp)
	move	$4,$2
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$3,116($fp)
	lw	$2,0($2)
	beq	$3,$2,$L9
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L9:
	move	$2,$4
	move	$sp,$fp
	lw	$31,156($sp)
	lw	$fp,152($sp)
	lw	$23,148($sp)
	lw	$22,144($sp)
	lw	$21,140($sp)
	lw	$20,136($sp)
	lw	$19,132($sp)
	lw	$18,128($sp)
	lw	$17,124($sp)
	lw	$16,120($sp)
	addiu	$sp,$sp,160
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
