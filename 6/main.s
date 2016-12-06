.section .data
items:
    .long 1, 2, 3, 4, 5, 6, 7, 8
    .section .text
.LC0:
    .string "%d\n"
.LC1:
    .string "%s\n"
.LHOTB1:
    .globl  main
    .type   main, @function

pnum:
  push    %rbp
  mov     %rsp, %rbp
  and     $-16, %rsp
  mov     %rdi, %rsi
  mov     $.LC1, %rdi
  call    printf
  leave
  ret

main:
  push    %rbp
  mov     %rsp, %rbp
  mov     %rsi, %rdi
  mov     $1, %rcx
  mov     (%rdi,%rcx, 8), %rdi
  call    pnum
  xor     %rax, %rax
  leave
  ret
