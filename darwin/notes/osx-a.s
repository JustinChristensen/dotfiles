# as -o a.o a.s && ld -static -o a a.o 

.globl start

start:
    # ...
    movq $0x2000001, %rax	# exit syscall (see disassembly of /usr/lib/system/libsystem_kernel.dylib)
    movq $100, %rdi		# exit code
    syscall

