    .intel_syntax   noprefix
    .section    .data
f:  .string "%d\n"
    .text
    .globl  main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 4
    mov ebx, 0
    mov DWORD PTR [rbp - 4], 1
loop:
    cmp DWORD PTR [rbp - 4], 1000000
    jg  end_loop
    lea rdi, [rip + f]
    mov esi, [rbp - 4]
    mov eax, 0
    call printf
    mov eax, ebx
    mov ebx, [rbp - 4]
    add [rbp - 4], eax
    jmp loop
end_loop:
    mov eax, 0
    leave
    ret
