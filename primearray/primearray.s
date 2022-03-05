    .intel_syntax noprefix
    .set n, 100
    .set size, (n*4)
    .data
f:  .string "%d\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, size
    mov rax, 2                          # i = 2
loop_init:
    cmp rax, n                          # while i < n
    jge endloop_init
    mov DWORD PTR [rbp+rax*4-size], 1   #   a[i] = true
    inc rax                             #   i++
    jmp loop_init
endloop_init:
    mov rax, 2                          # i = 2
loop_num:
    cmp rax, n                          # while i < n
    jge endloop_num
    cmp DWORD PTR [rbp+rax*4-size], 0   #   if a[i] == false
    je  endloop_filter                  #       continue
    mov rbx, rax                        #   j = i
loop_filter:                            #   do
    add rbx, rax                        #       j += i
    cmp rbx, n                          #   while j < n
    jge endloop_filter
    mov DWORD PTR [rbp+rbx*4-size], 0   #       a[j] = false
    jmp loop_filter
endloop_filter:
    inc rax                             #   i++
    jmp loop_num
endloop_num:
    mov rbx, 2                          # i = 2
loop_print:
    cmp rbx, n                          # while i < n
    jge endloop_print
    cmp DWORD PTR [rbp+rbx*4-size], 0   #   if a[i] == 0
    je  not_prime                       #       continue
    lea rdi, [rip+f]                    #   printf("%d\n", i)
    mov rsi, rbx
    call printf
not_prime:
    inc rbx                             #   i++
    jmp loop_print
endloop_print:
    mov rax, 0
    leave
    ret
