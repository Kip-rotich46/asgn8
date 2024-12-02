section .data
    prompt db "Enter the number of Fibonacci digits: ", 0  ; Prompt message for user input
    fmt db "%d", 0                                         ; Format specifier for scanf (integer input)
    newline db 10, 0                                       ; Newline character to move output to the next line
    fib_msg db "Fibonacci: ", 0                            ; Message to display before printing Fibonacci sequence

section .bss
    num resd 1                                             ; Reserve space for the user's input (number of Fibonacci digits)
    fib1 resd 1                                            ; Reserve space for the first Fibonacci number
    fib2 resd 1                                            ; Reserve space for the second Fibonacci number
    temp resd 1                                            ; Reserve space for a temporary variable used in calculations

section .text
    global main                                            ; Declare the entry point of the program
    extern printf, scanf                                   ; Declare external functions from the C library (printf and scanf)

main:
    ; Prompt user for input
    push prompt                                            ; Push the prompt message onto the stack
    call printf                                            ; Call printf to display the prompt
    add esp, 4                                             ; Clean up the stack (remove the prompt argument)

    ; Read input
    push num                                               ; Push the address of `num` onto the stack
    push fmt                                               ; Push the format specifier ("%d") onto the stack
    call scanf                                             ; Call scanf to read an integer from the user
    add esp, 8                                             ; Clean up the stack (remove the arguments for scanf)

    ; Initialize Fibonacci variables
    mov eax, 0                                             ; Set fib1 = 0
    mov [fib1], eax                                        ; Store the value in fib1
    mov eax, 1                                             ; Set fib2 = 1
    mov [fib2], eax                                        ; Store the value in fib2

    ; Print Fibonacci message
    push fib_msg                                           ; Push the "Fibonacci: " message onto the stack
    call printf                                            ; Call printf to display the message
    add esp, 4                                             ; Clean up the stack (remove the fib_msg argument)

    ; Load user input
    mov eax, [num]                                         ; Load the value of `num` into eax
    cmp eax, 1                                             ; Compare `num` with 1
    jle single_fib                                         ; If num <= 1, jump to single_fib (skip the loop)

    ; Loop to calculate Fibonacci numbers
fib_loop:
    ; Print fib1
    mov eax, [fib1]                                        ; Load the value of fib1 into eax
    push eax                                               ; Push fib1 onto the stack
    push fmt                                               ; Push the format specifier ("%d") onto the stack
    call printf                                            ; Call printf to print the current Fibonacci number
    add esp, 8                                             ; Clean up the stack (remove the arguments for printf)

    ; Calculate the next Fibonacci number
    mov eax, [fib1]                                        ; Load fib1 into eax
    mov ebx, [fib2]                                        ; Load fib2 into ebx
    add eax, ebx                                           ; Calculate fib1 + fib2
    mov [temp], eax                                        ; Store the result in temp

    ; Update fib1 and fib2 for the next iteration
    mov eax, [fib2]                                        ; Set fib1 = fib2
    mov [fib1], eax                                        ; Update fib1
    mov eax, [temp]                                        ; Set fib2 = temp
    mov [fib2], eax                                        ; Update fib2

    ; Decrement counter and loop
    dec dword [num]                                        ; Decrease num by 1
    cmp dword [num], 1                                     ; Check if num > 1
    jg fib_loop                                            ; If num > 1, continue the loop

single_fib:
    ; Print the final Fibonacci number
    mov eax, [fib1]                                        ; Load the final value of fib1 into eax
    push eax                                               ; Push fib1 onto the stack
    push fmt                                               ; Push the format specifier ("%d") onto the stack
    call printf                                            ; Call printf to print the last Fibonacci number
    add esp, 8                                             ; Clean up the stack (remove the arguments for printf)

    ; Print a newline
    push newline                                           ; Push the newline character onto the stack
    call printf                                            ; Call printf to move the cursor to the next line
    add esp, 4                                             ; Clean up the stack (remove the newline argument)

    ; Exit program
    xor eax, eax                                           ; Set eax = 0 (exit status code)
    ret                                                    ; Return from the program
