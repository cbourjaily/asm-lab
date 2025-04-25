.eqi SYS_write, 1
.equ SYS_exit, 60

.equ STDOUT_FILENO, 1

.global _start
.type _start, @function
_start:
	movq (%rsp), %r12	/* r12 = argc */
	cmp $1, %r12		/* Compare argc to 1 */

	movq $1, %r13		/* r13 = 1, arg index */

main_loop: /* Main loop */
	/* Get next arg string */
	movq 8(%rsp, %r13, 8), %rsi	/* rsi = argv[r13] */
	addq $1, %r13			/* ++r13 */
	
