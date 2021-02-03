; hello.asm

section .data
        NUL     equ     0x00
        LF      equ     0x0a
        msg     db      "Hello, World!", LF, NUL
        len     equ     $-msg-1
section .bss
section .text
        global  main
main:   push    rbp             ; prologue
        mov     rbp,    rsp     ; prologue
        mov     rax,    1       ; 1 = write
        mov     rdi,    1       ; 1 = to stdout
        mov     rsi,    msg     ; message to print
        mov     rdx,    len     ; length of message w/o trailing NUL
        syscall                 ; print the message
        mov     rsp,    rbp     ; epilogue
        pop     rbp             ; epilogue
        ret
