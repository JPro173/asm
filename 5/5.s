.LC0:
    .string "%d\n"
.LC1:
    .string "%d\n"
.LC2:
    .string "%d.%d\n"
.LHOTB1:
    .globl  main
    .type   main, @function

pnum:
    push    %rbp
    mov     %rsp, %rbp
    mov     %rdi, %rsi
    mov     $.LC0, %rdi
    call    printf
    leave
    ret

swap:
    push    %rbp
    mov     %rsp, %rbp
    sub     $16, %rsp
    push    (%rdi)
    push    8(%rdi)
    pop     (%rdi)
    pop     8(%rdi)
    leave
    ret

qwe:
    push    %rbp
    mov     %rsp, %rbp
    sub     $16, %rsp
    push    %rdi
    push    %rsi
    mov     $16, %rdi
    call    malloc
    pop     %rsi
    pop     %rdi
    mov     %rdi, (%rax)
    mov     %rsi, 8(%rax)
    leave
    ret

print_qwe:
    push    %rbp
    mov     %rsp, %rbp
    mov     (%rdi), %rsi
    mov     8(%rdi), %rdx
    mov     $.LC2, %rdi
    call    printf
    leave
    ret

swap_qwe:
    push    %rbp
    mov     %rsp, %rbp
    sub     $32, %rsp

    push    (%rdi)
    push    8(%rdi)
    push    (%rsi)
    push    8(%rsi)
    pop     8(%rdi)
    pop     (%rdi)
    pop     8(%rsi)
    pop     (%rsi)
    leave
    ret

cmp_qwe:
    push    %rbp
    mov     %rsp, %rbp
    sub     $16, %rsp
    push    %rdi
    push    %rsi
    mov     (%rsi), %rsi
    mov     (%rdi), %rdi
    cmp     %rdi, %rsi
    mov     $1, %rdi
    cmovg   %rdi, %rax
    mov     $-1, %rdi
    cmovl   %rdi, %rax
    jne     .LFE_CMP
    pop     %rsi
    pop     %rdi
    mov     8(%rsi), %rsi
    mov     8(%rdi), %rdi
    cmp     %rdi, %rsi
    mov     $0, %rdi
    cmove   %rdi, %rax
    mov     $1, %rdi
    cmovg   %rdi, %rax
    mov     $-1, %rdi
    cmovl   %rdi, %rax
.LFE_CMP:
    leave
    ret

main:
    push    %rbp
    mov     %rsp, %rbp
    sub     $24, %rsp

    mov     $2, %rdi
    mov     $1, %rsi
    call    qwe
    push    %rax

    mov     $2, %rdi
    mov     $3, %rsi
    call    qwe
    push    %rax

    mov     $1, %rdi
    mov     $0, %rsi
    call    qwe
    push    %rax

    mov     $0, %rcx
.LFB_LOOP:
    mov     (%rsp, %rcx), %r8
    add     $8, %rcx
    mov     (%rsp, %rcx), %r9
    cmp     $24, %rcx
    jge     .LFE_MAIN
    mov     %r8, %rdi
    mov     %r9, %rsi
    call    cmp_qwe
    cmp     $0, %rax
    jge     .LFB_LOOP
    mov     %r8, %rdi
    mov     %r9, %rsi
    call    swap_qwe
    mov     $0, %rcx
.LFE_MAIN:
    mov     (%rsp), %rdi
    call    print_qwe
    mov     8(%rsp), %rdi
    call    print_qwe
    mov     16(%rsp), %rdi
    call    print_qwe
    leave
    ret
