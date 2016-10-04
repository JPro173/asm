.LC0:
    .string "%d\n"
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

mod:
    push    %rbp
    mov     %rsp, %rbp
    xor     %rdx, %rdx
    mov     %rdi, %rax
    div     %rsi
    mov     %rdx, %rax
    leave
    ret

is_prime:
    push    %rbp
    mov     %rsp, %rbp
    push    %rdi

    mov     %rdi, %rax
    xor     %rdx, %rdx
    mov     $2, %rsi
    div     %rsi
    push    %rax


    push    %rax
    push    $1
.LFB_LOOP:
    incq    (%rsp)
    mov     (%rsp), %rdi
    mov     -8(%rbp), %rdi
    mov     (%rsp), %rsi
    call    mod
    cmp     $0, %rax
    je     .LFE_FAIL

    mov     8(%rsp), %rdi
    cmp     (%rsp), %rdi
    jge     .LFB_LOOP
    mov     $1, %eax
    jmp     .LFE_EXIT
.LFE_FAIL:
    xor     %eax, %eax
.LFE_EXIT:
    leave
    ret

main:
    push    %rbp
    mov     %rsp, %rbp
    
    mov     $10111, %rdi
    call    is_prime

    mov     %rax, %rdi
    call pnum
    leave
ret
