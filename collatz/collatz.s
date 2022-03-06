    .intel_syntax noprefix
    .data
f:  .string "%lld\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    mov rbx, 9663       # i = {your_number}
loop:                   # do
    lea rdi, [rip+f]
    mov rsi, rbx
    xor rax, rax
    call printf         #   printf("%d\n", i)
    cmp rbx, 1          # while i != 1
    je  endloop
    mov rax, rbx        #   j = i
    shr rax, 1          #   j >>= 1
    shl rax, 1          #   j <<= 1
    cmp rax, rbx        #   if j == i
    jne odd
    shr rbx, 1          #       i >> 1
    jmp loop
odd:                    #   else
    imul rbx, 3         #       i *= 3
    inc rbx             #       i++
    jmp loop
endloop:
    xor rax, rax
    leave
    ret
