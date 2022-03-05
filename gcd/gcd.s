    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global gcd
    .global main
gcd:
    push rbp
    mov rbp, rsp
    cmp edi, esi
    jge loop
    mov eax, edi
    mov edi, esi
    mov esi, eax
loop:
    cmp esi, 0
    je  end_loop
    mov eax, edi
    cdq
    idiv esi
    mov edi, esi
    mov esi, edx
    jmp loop
end_loop:
    mov eax, edi
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    mov edi, 18
    mov esi, 48
    call gcd
    lea rdi, [rip + f]
    mov esi, eax
    call printf
    mov eax, 0
    leave
    ret
