; HLL CALL: int is_palindrom(uint num) | returns 1 if palindrome else 0
section .data

is_palindrome_flag db 1

section .text
global is_palindrome

is_palindrome:
    push rbx
    push rcx
    push rdx

    mov byte [is_palindrome_flag], 1
    mov eax, edi
    mov ebx, 10
push_loop:
    xor edx, edx
    div ebx
    push rdx
    test eax, eax
    jnz push_loop

    mov eax, edi
pop_loop:
    xor edx, edx
    div ebx 
    pop rcx
    cmp edx, ecx
    je curr_digit_same
    mov byte [is_palindrome_flag], 0
curr_digit_same:    
    test eax, eax
    jnz pop_loop

finish:
    pop rdx
    pop rcx
    pop rbx
    xor eax, eax
    mov al, byte [is_palindrome_flag] 
    ret