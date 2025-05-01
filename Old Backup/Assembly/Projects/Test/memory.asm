.global _start

_section .text

_start:	mov rax, 1		;Syscall for write
	mov rdi, 1		;File handle 1 is stdout
	mov rsi, message	;Address of string to output
	mov rbx, 0		;Return Status
	mov rdx, 13		;number of bytes
	syscall			;invoke operating system to do the write
	mov rax, 60		;syscall for exit
	xor rdi, rdi		;exit code 0
	syscall			;invole operating system to exit

	section .data

message: db	"Hello, World", 10
