    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global fact
    .global main
fact:
    push rbp
    mov rbp, rsp
    cmp edi, 1
    je  end_fact
    imul edi
    dec edi
    call fact
end_fact:
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    mov edi, 10
    mov eax, 1
    call fact
    lea rdi, [rip + f]
    mov esi, eax
    mov eax, 0
    call printf
    mov eax, 0
    leave
    ret
