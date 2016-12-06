.LC0:
    .string "%d\n"
.LC1:
    .string "%d"
.LC_THREE_NUMS:
    .string "%d %d %d"
.LHOTB1:
    .globl  main
    .type   main, @function

pnum:
    push   %rbp
    mov    %rsp, %rbp
    mov    %rdi, %rsi
    mov    $.LC0, %rdi
    call   printf
    leave
    ret

rnum:
    push   %rbp
    mov    %rsp, %rbp
    sub    $16, %rsp
    mov    $.LC1, %rdi
    mov    %rsp, %rsi
    call   scanf
    mov    (%rsp), %rax
    leave
    ret

range:
    push   %rbp
    mov    %rsp, %rbp
    push   %rdi
    push   %rsi
    push   %rdx

    sub    %rdi, %rsi
    mov    %rdx, %rdi
    mov    %rsi, %rax
    xor    %rdx, %rdx
    div    %rdi
    push   %rax
    mov    (%rsp), %rdi

    mov    (%rsp), %rax
    imul   $8, %rax
    mov    %rax, %rdi

    call   malloc
    pop    %rcx
    push   %rax

    mov    $0, %r15
.LFB_LOOP_R:
    mov    -8(%rbp), %rdi
    mov    (%rsp), %rsi
    add    %r15, %rsi
    mov    %rdi, (%rsi)

    add    $8, %r15

    mov    -24(%rbp), %rdi
    add    %rdi, -8(%rbp)

    mov    -8(%rbp), %rdi
    cmp    -16(%rbp), %rdi
    jl     .LFB_LOOP_R

    mov    %r15, %rax
    xor    %rdx, %rdx
    mov    $8, %rsi
    div    %rsi
    mov    %rax, %rdx
    mov    (%rsp), %rax

    leave
    ret

parray:
    push   %rbp
    mov    %rsp, %rbp
    push   $0
    push   $0
    push   %rdi
    push   %rsi
    movq   $0, -8(%rbp)
.LFB_LOOP_PA:
    mov    -8(%rbp), %rcx
    cmp    (%rsp), %rcx
    jge    .LFE_EXIT_PA
    mov    -8(%rbp), %rcx
    imul   $8, %rcx
    mov    8(%rsp), %rdi
    add    %rcx, %rdi
    mov    (%rdi), %rdi
    call   pnum
    incq   -8(%rbp)
    jmp   .LFB_LOOP_PA
.LFE_EXIT_PA:
    leave
    ret

main:
    push   %rbp
    mov    %rsp, %rbp
    sub    $32, %rsp

    movq   $0, (%rsp)
    movq   $0, 8(%rsp)
    movq   $0, 16(%rsp)
    mov    $.LC_THREE_NUMS, %rdi
    mov    %rsp, %rcx
    mov    %rcx, %rsi
    add    $8, %rcx
    mov    %rcx, %rdx
    add    $8, %rcx
    call   scanf
    mov    (%rsp), %rdi
    mov    8(%rsp), %rsi
    mov    16(%rsp), %rdx
#    movq    $12, %rdi
#    movq    $100, %rsi
#    movq    $10, %rdx
    xor    %rcx, %rcx
    call   range
    mov    %rax, %rdi
    mov    %rdx, %rsi
    call   parray

    leave
    ret
