# Makefile for building the Fibonacci program

# The "all" target is the default target that is built when "make" is run without specifying a target.
# It depends on the "fibonacci_program" target.
all: fibonacci_program

# Rule to build the final executable "fibonacci_program".
# It depends on the object file "asgn8.o".
# The "-m32" flag ensures 32-bit compilation, and "-nostdlib" excludes linking with the standard C library.
fibonacci_program: asgn8.o
	gcc -m32 -nostdlib -o fibonacci_program asgn8.o  # Link the object file to create the final executable

# Rule to assemble the assembly source file "asgn8.s" into an object file "asgn8.o".
# It uses the "nasm" assembler with the "-f elf32" flag to generate a 32-bit ELF object file.
asgn8.o: asgn8.s
	nasm -f elf32 asgn8.s -o asgn8.o  # Assemble the assembly code into an object file

# Rule to clean up generated files.
# It removes any object files (*.o) and the final executable ("fibonacci_program").
clean:
	rm -f *.o fibonacci_program  # Remove intermediate and final build files
