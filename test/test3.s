    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global func
    .global main
func:
    mov eax, [rsp + 8]
    add eax, [rsp + 16]
    ret
main:
    push rbp
    mov rbp, rsp
    push 2
    push 3
    call func
    lea rdi, [rip + f]
    mov esi, eax
    mov eax, 0
    call printf
    mov eax, 0
    leave
    ret
