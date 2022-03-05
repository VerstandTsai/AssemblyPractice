    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global fib
    .global main

fib:
    push rbp
    mov rbp, rsp
    sub rsp, 4
    cmp edi, 2
    jle end_fib
    mov [rbp - 4], edi
    sub edi, 1
    call fib
    mov edi, [rbp - 4]
    sub edi, 2
    call fib
    leave
    ret
end_fib:
    inc eax
    leave
    ret

main:
    push rbp
    mov rbp, rsp
    mov ebx, 1
loop:
    cmp ebx, 10
    jg  end_loop
    mov edi, ebx
    mov eax, 0
    call fib
    lea rdi, [rip + f]
    mov esi, eax
    mov eax, 0
    call printf
    inc ebx
    jmp loop
end_loop:
    mov eax, 0
    leave
    ret
