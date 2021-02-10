; hello.asm

section .data
        NUL     equ     0x00
        LF      equ     0x0a
        fmt     db      "Hello, World!", LF, NUL
section .bss
section .text
        extern  printf
        global  main
main:   push    rbp             ; prologue
        mov     rbp,    rsp     ; prologue
        mov     rax,    1       ; 1 argument
        mov     rdi,    fmt     ; format specifier
        call    printf          ; call printf()
        mov     rax,    0       ; set return code
        mov     rsp,    rbp     ; epilogue
        pop     rbp             ; epilogue
        ret                     ; return
