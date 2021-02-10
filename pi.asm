; pi.asm

section .data
        NUL     equ     0x00
        LF      equ     0x0a
        fmt     db      "%lf", LF, NUL
        pi      dq      3.14159265358979323846
section .bss
section .text
        extern  printf
        global  main
main:   push    rbp             ; prologue
        mov     rbp,    rsp     ; prologue
        mov     rax,    1       ; 1 argument
        mov     rdi,    fmt     ; format specifier
        movq    xmm0,   [pi]    ; load value of pi
        call    printf          ; call printf()
        mov     rax,    0       ; set return code
        mov     rsp,    rbp     ; epilogue
        pop     rbp             ; epilogue
        ret                     ; return
