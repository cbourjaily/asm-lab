.section .data
	out_fmt: .string "Gauss sum of %d is %d\n"

.section .text
	.globl main

main:
	# Set n = 100
	movl $100, %edi				# First argument to printf (for display: n = 100)
	movl $100, %eax				# Load n into %eax for calculation

	# Compute n + 1
	movl %eax, %ecx				# %ecx = n
	addl $1, %ecx				# %ecx = n + 1

	# Multiply: %eax = n * (n + 1)
	imull %ecx, %eax			# %eax = %eax * %ecx

	# Divide by 2
	movl $2, %ecx				# divisor = 2
	xorl %edx, %edx				# clear %edx before idiv
	idivl %ecx				# %eax = %eax / 2

	# %eax now holds the result of the Gauss sum
  
	 # Call printf
 	 movl $100, %esi                # Second argument to printf (n again)
	 movl %eax, %edx            	# Third argument to printf (sum result)
	 leaq out_fmt(%rip), %rdi   	# First argument (format string)
	 movl $0, %eax              	# Clear %eax for variadic call
	 call printf

	 # Return 0
	 movl $0, %eax
	 ret



