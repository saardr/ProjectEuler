section .data

SYS_exit equ 60
EXIT_success equ 0
MAXNUM equ 1000

printfMessage db "%d", 10, 0
sum dd 0

section .text
global main
extern printf
main:
  mov ecx, MAXNUM
  dec rcx
sumLoop:
  mov eax, ecx
isDividedByFive:
  xor rdx, rdx
  mov ebx, 5
  div ebx
  test edx, edx
  jnz isDividedByThree
  add dword[sum], ecx
  jmp repLoop
isDividedByThree:
  xor rdx, rdx
  mov ebx, 3
  mov eax, ecx
  div ebx
  test edx, edx
  jnz repLoop
  add dword[sum], ecx
repLoop:
  loop sumLoop

printResult:
  xor rax, rax
  mov rdi, printfMessage
  mov esi, dword [sum]
  call printf
  mov rax, SYS_exit
  mov rdi, EXIT_success
  syscall
