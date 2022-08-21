%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    PRINT_STRING msg
    
    xor rax, rax
    ret
    
section .data
    msg db 'Hello World', 0x00
    
    
    ; 주석처리  
    
    ; 10진수(0 1 2 3 4 5 6 7 8 9)
    ; 10 11 12 13 ... 19 20
    
    ; 2진수(0 1)
    ; 0 1 10
    ; 0b0 0b1 0b10 0b11 0b100 (binary)
    
    ; 16진수(0 1 2 3 4 5 6 7 8 9 A B C D E F)
    ; 0 1 2 3 4 5 6 7 8 9 A B C D E F 10
    ; 0x00 0x01 (Hexadecimal)
    
    ; 2진수 -> 16진수
    ; 0b '1001' '0101' -> 0x '9' '5'
    ; 0b10010101 = 0x95
    