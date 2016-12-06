.LC0:
    .string "%d"
.LC1:
    .string "%s\n"
.LHOTB1:
    .globl  main
    .type   main, @function

caa12:
    push    %rbp
    mov     %rsp, %rbp
    leave
    ret

main:
    push    %rbp
    mov     %rsp, %rbp

/*    sub    $16, %rsp

    mov     $.LC0, %rdi
    mov     %rsp, %rsi
    call    scanf

    mov     (%rsp), %rax
    cmp     %rax, $0*/
    mov     %rsi, %rdi
    add     $4, %rdi
    push    %rdi
    jmp      caa12

    leave
    ret
