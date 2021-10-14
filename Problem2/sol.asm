section .data

SYS_exit equ 60
EXIT_success equ 0

MAXNUM equ 4000000 ; i.e 4 million
FIB1 equ 0
FIB2 equ 1

printfMessage db "the result is: %d", 10, 0
sum dd 0

section .text
global main
extern printf

main:
  mov edi, FIB1
  mov esi, FIB2
  mov ecx, MAXNUM
  mov ebx, 2
sumLoop:
  mov eax, edi
  add eax, esi
  cmp eax, MAXNUM
  jg finish
  mov edi, esi
  mov esi, eax
isEven:
  xor edx, edx
  div ebx
  test edx, edx
  jnz repLoop
  add dword [sum], esi
repLoop:
  jmp sumLoop

finish:
  xor rax, rax
  mov rdi, printfMessage
  mov esi, dword [sum]
  call printf
  mov eax, SYS_exit
  mov rdi, EXIT_success
  syscall
