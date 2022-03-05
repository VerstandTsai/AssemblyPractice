    .intel_syntax noprefix
    .section .data
f:  .string "%d\n"
    .text
    .global is_prime
    .global main
is_prime:
    push rbp
    mov rbp, rsp
    sub rsp, 4
    cmp edi, 1
    jle false
    mov DWORD PTR [rbp - 4], 2
test_loop:
    mov eax, [rbp - 4]
    imul eax
    cmp eax, edi
    jg  true
    mov eax, edi
    mov ecx, [rbp - 4]
    cdq
    idiv ecx
    cmp edx, 0
    je  false
    inc DWORD PTR [rbp - 4]
    jmp test_loop
false:
    mov eax, 0
    leave
    ret
true:
    mov eax, 1
    leave
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov DWORD PTR [rbp - 4], 1
loop:
    cmp DWORD PTR [rbp - 4], 100
    jg  end_loop
    mov edi, [rbp - 4]
    call is_prime
    cmp eax, 1
    jne end_print
    lea rdi, [rip + f]
    mov esi, [rbp - 4]
    mov eax, 0
    call printf
end_print:
    inc DWORD PTR [rbp - 4]
    jmp loop
end_loop:
    mov eax, 0
    leave
    ret
