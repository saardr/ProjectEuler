section .data

SYS_EXIT equ 60

INPUT_NUM equ 600851475143
INPUT_NUM_SQRT equ 775146           ; this is not fully profesional, but i 
                                    ; just used an online calculator for this

print_msg db "the result is: %d", 10, 0
result dd 0

section .text
global main
extern printf
extern gen_prime_lst
extern print_zero_terminated_list

main:
    mov edi, INPUT_NUM_SQRT
    call gen_prime_lst
    ; mov rdi, rax
    ; call print_zero_terminated_list ; DEBUGGING
    mov rbx, rax                      ; rbx -> prime_lst
    mov rsi, INPUT_NUM
go_over_primes_loop:
    mov ecx, dword [rbx]
    test ecx, ecx
    jz finish_main
    mov rax, rsi
    xor edx, edx
    div rcx
    test edx, edx                     ; if remainder is 0
    jnz next_loop
prime_divides_input:
    mov dword [result], ecx
next_loop:
    add rbx, 4
    jmp go_over_primes_loop

finish_main:
    mov rdi, print_msg
    mov esi, dword [result]
    xor eax, eax
    call printf
    mov eax, SYS_EXIT
    xor rdi, rdi                      ; exit code 0
    syscall

