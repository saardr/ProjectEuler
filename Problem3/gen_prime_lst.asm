; HLL CALL: uint* gen_prime_lst(uint target) where target >= 2
; return a list containing the first 10,000 primes OR until target
; since 0 is not a prime, the index with value 0 is like null-terminate for strings

section .data

MAX_PRIME_COUNT equ 10000 ; 10,000

target dd 100
printf_msg_int db "%d", 10, 0

section .text
global gen_prime_lst
global print_zero_terminated_list
extern printf

gen_prime_lst:
    push rbx
    push rcx
    push rdx
    push rsi

    mov ebx, 2                          ; current num
    mov dword [prime_lst], ebx          ; first prime is 2
    mov esi, 1                          ; current prime count
next_num:
    inc ebx
    cmp ebx, edi                        ; edi = target
    ja finish_gen_prime_lst
    mov ecx, esi                        ; ecx - 1 = last char index
is_prime_loop:
    mov eax, ebx
    xor edx, edx                        ; target <= 2^32 implies ebx <= 2^32
    div dword [prime_lst + ecx*4 - 4]
    test edx, edx
    jz num_is_not_prime
    loop is_prime_loop
num_is_prime:
    inc esi
    mov dword [prime_lst + esi*4 - 4], ebx
num_is_not_prime:
    cmp esi, MAX_PRIME_COUNT
    jb next_num
finish_gen_prime_lst:
    mov dword [prime_lst + esi + 4], 0  ; "null terminate"
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    mov rax, prime_lst
    ret

; HLL CALL: void print_zero_terminated_list(uint* list) 
print_zero_terminated_list:
    push rax
    push rbx
    push rsi

    mov rbx, rdi                        ; rbx -> list 

print_zero_terminated_list_loop:
    xor eax, eax                        ; that way printf knows the param is not float
    mov rdi, printf_msg_int
    mov esi, dword [rbx]
    test esi, esi
    jz finish_print_zero_terminated_list
    call printf
    add rbx, 4
    jmp print_zero_terminated_list_loop

finish_print_zero_terminated_list:
    pop rsi
    pop rbx
    pop rax
    ret


section .bss

prime_lst resd MAX_PRIME_COUNT+1