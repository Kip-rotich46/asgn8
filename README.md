## Assembly Language Program
Fibonacci Sequence Program in Assembly
This program calculates and prints the Fibonacci sequence based on user input. The program is written in x86 assembly and uses standard I/O functions (printf and scanf) for input and output.

Requirements
NASM (The Netwide Assembler)
GCC with 32-bit support (gcc -m32)
Linux-based operating system or WSL (Windows Subsystem for Linux)
Files
asgn8.s: The assembly source code for the Fibonacci sequence program.
How to Compile and Run
Assemble the source file using NASM:

bash
Copy code
nasm -f elf32 -o asgn8.o asgn8.s
Link the object file with GCC:

bash
Copy code
gcc -m32 -o asgn8 asgn8.o -nostartfiles -lc
Run the program:

bash
Copy code
./asgn8
Example Execution:

text
Copy code
Enter the number of Fibonacci digits: 5
Fibonacci: 0 1 1 2 3
How the Program Works
Prompts the user to input the number of Fibonacci digits.
Reads the input using scanf.
Calculates the Fibonacci sequence iteratively.
Prints the sequence using printf.
Troubleshooting
If you encounter an error like fatal error: stdio.h: No such file or directory, ensure you have 32-bit libraries installed:

bash
Copy code
sudo apt install libc6-dev-i386
If NASM or GCC isn't installed, install them using:

bash
Copy code
sudo apt install nasm gcc
Make sure you are using a 32-bit system or compiling with -m32 for compatibility.