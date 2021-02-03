; hello.asm
section .data
        msg     db      "Hello, World!", 10, 0
        len     equ     $-msg-1
section .bss
section .text
        global  main
main:
        mov     rax,    1       ; 1 = write
        mov     rdi,    1       ; 1 = to stdout
        mov     rsi,    msg     ; message to print
        mov     rdx,    len     ; length of message w/o trailing NUL
        syscall                 ; print the message
        mov     rax,    60      ; 60 = exit
        mov     rdi,    0       ; 0 = success
        syscall                 ; quit program
