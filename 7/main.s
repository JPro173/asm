.section .data
items:
    .long 1, 2, 3, 4, 5, 6, 7, 8
    .section .text
.LC0:
    .string "%d\n"
.LHOTB1:
    .globl  main
    .type   main, @function

pnum:
  push    %rbp
  mov     %rsp, %rbp
  and     $-16, %rsp
  mov     %rdi, %rsi
  mov     $.LC0, %rdi
  call    printf
  leave
  ret

main:
  push    %rbp
  mov     %rsp, %rbp
  cld
  mov     $8, %rcx
  xor     %rax, %rax
  dec     %rax
  lea     items, %rdi
  rep     stosl
  mov     $7, %rcx
  mov     items(,%rcx, 4), %rdi
  call    pnum
  xor     %rax, %rax
  leave
  ret
