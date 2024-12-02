section .data
    prompt db "Enter the number of Fibonacci digits: ", 0
    fmt db "%d", 0
    newline db 10, 0  ; Line feed
    fib_msg db "Fibonacci: ", 0

section .bss
    num resd 1
    fib1 resd 1
    fib2 resd 1
    temp resd 1

section .text
    global main
    extern printf, scanf

main:
    ; Prompt user for input
    push prompt
    call printf
    add esp, 4

    ; Read input
    push num
    push fmt
    call scanf
    add esp, 8

    ; Initialize Fibonacci variables
    mov eax, 0      ; fib1 = 0
    mov [fib1], eax
    mov eax, 1      ; fib2 = 1
    mov [fib2], eax

    ; Print Fibonacci message
    push fib_msg
    call printf
    add esp, 4

    ; Load user input
    mov eax, [num]  ; eax = num
    cmp eax, 1      ; If num <= 1, skip the loop
    jle single_fib

    ; Loop to calculate Fibonacci
fib_loop:
    ; Print fib1
    mov eax, [fib1]
    push eax
    push fmt
    call printf
    add esp, 8

    ; Calculate next Fibonacci number
    mov eax, [fib1]
    mov ebx, [fib2]
    add eax, ebx       ; temp = fib1 + fib2
    mov [temp], eax

    ; Update fib1 and fib2
    mov eax, [fib2]
    mov [fib1], eax
    mov eax, [temp]
    mov [fib2], eax

    ; Decrement counter and loop
    dec dword [num]
    cmp dword [num], 1
    jg fib_loop

single_fib:
    ; Print final Fibonacci number
    mov eax, [fib1]
    push eax
    push fmt
    call printf
    add esp, 8

    ; Print newline
    push newline
    call printf
    add esp, 4

    ; Exit program
    xor eax, eax
    ret
