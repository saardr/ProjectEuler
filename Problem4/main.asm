section .data

MIN_NUM equ 100
MAX_NUM equ 999

printf_msg db "the result is: %d", 10, 0
result dd 0

section .text
global main
extern printf
extern is_palindrome

main:
    mov ebx, MIN_NUM
outer_loop:
    mov ecx, ebx
inner_loop:
    mov eax, ecx
    mul ebx
    mov edi, eax
    mov edx, eax
    call is_palindrome
    test eax, eax
    jz next_inner_loop
    cmp edx, dword [result]
    jbe next_inner_loop
    mov dword [result], edx
next_inner_loop:
    inc ecx
    cmp ecx, MAX_NUM
    jbe inner_loop
next_outer_loop:
    inc ebx
    cmp ebx, MAX_NUM
    jbe outer_loop

print_result:
    mov rdi, printf_msg
    mov esi, dword [result]
    xor eax, eax
    call printf
finish:
    mov rax, 60
    xor edi, edi
    syscall
