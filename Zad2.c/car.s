	.file	"car.c"
	.text
	.globl	randNum
	.type	randNum, @function
randNum:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	call	rand@PLT
	movl	-8(%rbp), %edx
	subl	-4(%rbp), %edx
	leal	1(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	randNum, .-randNum
	.globl	randReal
	.type	randReal, @function
randReal:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC0(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	movsd	-16(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	randReal, .-randReal
	.globl	randModel
	.type	randModel, @function
randModel:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$90, %esi
	movl	$65, %edi
	call	randNum
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$10, %esi
	movl	$4, %edi
	call	randNum
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L6
.L7:
	movl	$122, %esi
	movl	$97, %edi
	call	randNum
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
.L6:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L7
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	randModel, .-randModel
	.globl	FillCars
	.type	FillCars, @function
FillCars:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L9
.L10:
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	randModel
	movl	$300, %esi
	movl	$100, %edi
	call	randNum
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movb	%dl, 21(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movsd	.LC1(%rip), %xmm0
	movq	.LC2(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	randReal
	movq	%xmm0, %rax
	movq	%rax, 24(%rbx)
	addl	$1, -20(%rbp)
.L9:
	movl	-20(%rbp), %eax
	cltq
	cmpq	%rax, -48(%rbp)
	ja	.L10
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	FillCars, .-FillCars
	.section	.rodata
	.align 8
.LC3:
	.string	"Model:%25s  Maxspeed:%5u   Price:%8.2lf\n"
	.text
	.globl	printCars
	.type	printCars, @function
printCars:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	24(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %eax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	%rcx, %rsi
	salq	$5, %rsi
	movq	-24(%rbp), %rcx
	addq	%rsi, %rcx
	movq	%rdx, %xmm0
	movl	%eax, %edx
	movq	%rcx, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L12:
	movl	-4(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	ja	.L13
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	printCars, .-printCars
	.globl	compModelASC
	.type	compModelASC, @function
compModelASC:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	compModelASC, .-compModelASC
	.globl	compModelDESC
	.type	compModelDESC, @function
compModelDESC:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	compModelDESC, .-compModelDESC
	.globl	compSpeedASC
	.type	compSpeedASC, @function
compSpeedASC:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	compSpeedASC, .-compSpeedASC
	.globl	compSpeedDESC
	.type	compSpeedDESC, @function
compSpeedDESC:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	compSpeedDESC, .-compSpeedDESC
	.globl	compPriceASC
	.type	compPriceASC, @function
compPriceASC:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC4(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L30
	movl	$0, %eax
	jmp	.L25
.L30:
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L31
	movl	$1, %eax
	jmp	.L25
.L31:
	movl	$-1, %eax
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	compPriceASC, .-compPriceASC
	.globl	compPriceDESC
	.type	compPriceDESC, @function
compPriceDESC:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC4(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L40
	movl	$0, %eax
	jmp	.L35
.L40:
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L41
	movl	$1, %eax
	jmp	.L35
.L41:
	movl	$-1, %eax
.L35:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	compPriceDESC, .-compPriceDESC
	.globl	getComparator
	.type	getComparator, @function
getComparator:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$6, -4(%rbp)
	ja	.L43
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L45(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L45(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L45:
	.long	.L43-.L45
	.long	.L50-.L45
	.long	.L49-.L45
	.long	.L48-.L45
	.long	.L47-.L45
	.long	.L46-.L45
	.long	.L44-.L45
	.text
.L50:
	leaq	compModelASC(%rip), %rax
	jmp	.L51
.L49:
	leaq	compModelDESC(%rip), %rax
	jmp	.L51
.L48:
	leaq	compSpeedASC(%rip), %rax
	jmp	.L51
.L47:
	leaq	compSpeedDESC(%rip), %rax
	jmp	.L51
.L46:
	leaq	compPriceASC(%rip), %rax
	jmp	.L51
.L44:
	leaq	compPriceDESC(%rip), %rax
	jmp	.L51
.L43:
	movl	$0, %eax
.L51:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	getComparator, .-getComparator
	.section	.rodata
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 8
.LC1:
	.long	0
	.long	1090021888
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 16
.LC4:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC5:
	.long	-755914244
	.long	1062232653
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
