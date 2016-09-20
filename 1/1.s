.LC0:
    .string "%d\n"
.LHOTB1:
    .globl  main
    .type   main, @function
pnum:
    push   %rbp
    mov    %rsp, %rbp
    mov %rdi, %rsi
    mov $.LC0, %rdi
    call printf
    leave
    ret
swap:
    push   %rbp
    mov    %rsp, %rbp
    sub    $16, %rsp
    push   (%rdi)
    push    8(%rdi)
    pop     (%rdi)
    pop     8(%rdi)
    leave
    ret
main:
    push   %rbp
    mov    %rsp, %rbp
#init stack
    sub    $32, %rsp
    push   $3
    push   $8
    push   $5
    push   $1
#swap bytes
    mov    $8, %rcx
.LFB21:
    mov    %rsp, %rdi
    add    %rcx, %rdi
    mov    8(%rdi), %rdx
    cmp    %rdx, (%rdi)
    jle    .LFB22
    mov    $0, %rcx
    call   swap
.LFB22:
    add    $8, %rcx
    cmp    $24, %rcx
    jne    .LFB21
#print swaped stack out
.LFB20:
    mov    (%rsp), %rdx
    imul   $8, %rdx
    mov    (%rsp, %rdx), %rdi
    call   pnum
    add    $1, (%rsp)
    cmp    $4, (%rsp)
    jne    .LFB20

    leave
    ret
