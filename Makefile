# Makefile for building the Fibonacci program
all: fibonacci_program

fibonacci_program: asgn8.o
	gcc -m32 -nostdlib -o fibonacci_program asgn8.o

asgn8.o: asgn8.s
	nasm -f elf32 asgn8.s -o asgn8.o

clean:
	rm -f *.o fibonacci_program
