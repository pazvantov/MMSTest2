	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"1.ModelASC\n2.ModelDESC\n3.SpeedASC\n4.SpeedDESC\n5.PriceASC\n6.PriceDESC"
.LC1:
	.string	"\nChoose:"
.LC2:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	-336(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	FillCars@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-340(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-340(%rbp), %eax
	movl	%eax, %edi
	call	getComparator@PLT
	movq	%rax, %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rcx
	movl	$32, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	qsort@PLT
	leaq	-336(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printCars@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
