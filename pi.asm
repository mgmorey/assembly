; pi.asm

section .data
        NUL     equ     0x00
        LF      equ     0x0a
        fmt     db      "%lf", LF, NUL
        pi      dq      3.1415926
section .bss
section .text
        extern  printf
        global  main
main:   push    rbp             ; prologue
        mov     rbp,    rsp     ; prologue
        mov     rax,    1       ; 1 xmm register used
        movq    xmm0,   [pi]    ; load value of pi
        mov     rdi,    fmt     ; format specifier
        call    printf          ; call printf()
        mov     rsp,    rbp     ; epilogue
        pop     rbp             ; epilogue
        ret
