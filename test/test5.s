    .intel_syntax noprefix
    .data
numstr:
    .string "%d\n"
hello:
    .string "Hello, world!\n"
    .macro printstr str
    lea rdi, [rip + \str]
    call printf
    .endm
    .macro printnum num
    lea rdi, [rip + numstr]
    mov esi, \num
    call printf
    .endm
    .macro initfunc mem
    push rbp
    mov rbp, rsp
    sub rsp, \mem
    .endm
    .macro endfunc
    leave
    ret
    .endm
    .text
    .global main
main:
    initfunc 0
    printstr hello
    printnum 42
    mov eax, 0
    endfunc
