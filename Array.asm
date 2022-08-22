%include "io64.inc"

section .text
global CMAIN
CMAIN:
    
    ; 배열 : 동일한 타입의 데이터 묶음
    ; - 배열을 구성하는 각 값을 배열 요소(element)라고 함
    ; - 배열의 위치를 가리키는 숫자를 인덱스(index)라고 함
    
    ; 주소 [시작 주소 + 인덱스 * 크기]
    
    ;PRINT_HEX 1, [a]
    ;NEWLINE
    ;PRINT_HEX 1, [a+1]
    ;NEWLINE
    ;PRINT_HEX 1, [a+2]
    ;NEWLINE    
    
    xor ecx, ecx
LABEL_PRINT_A:
    PRINT_HEX 1, [a+ecx]
    NEWLINE
    inc ecx
    cmp ecx, 5
    jne LABEL_PRINT_A    
    
    
    xor ecx, ecx
LABEL_PRINT_B:
    PRINT_HEX 2, [b+ecx*2]
    NEWLINE
    inc ecx
    cmp ecx, 5
    jne LABEL_PRINT_B
    
    
    xor rax, rax
    ret
    
section .data
    msg db 'Hello World', 0x00
    a db 0x01, 0x02, 0x03, 0x04, 0x05
    b times 5 dw 1 ;2바이트 크기 5개 배열 초기값 모두 1
    
section .bss
    num resb 10