%include "io64.inc"

section .text
global CMAIN
CMAIN:
    
    GET_DEC 1, al
    GET_DEC 1, num
    
    ; 더하기 연산
    ; add a, b (a = a + b)
    ; a는 레지스터 or 메모리
    ; b는 레지스터 or 메모리 or 상수
    ; - 단, a와 b 모두 메모리로 하면 안됨
    
    ; 빼기 연산
    ; 더하기와 동일 sub a, b (a = a - b)
    add al, 1 ; 레지스터 + 상수
    PRINT_DEC 1, al ; 1+1=2
    NEWLINE
    
    add al, [num] ; 레지스터 + 메모리
    PRINT_DEC 1, al
    NEWLINE
    
    mov bl, 3
    add al, bl ; 레지스터 + 레지스터
    PRINT_DEC 1, al
    NEWLINE
    
    add [num], byte 1 ; 메모리 + 상수
    PRINT_DEC 1, [num]
    NEWLINE
    
    add [num], al ; 메모리 + 레지스터
    PRINT_DEC 1, [num]
    NEWLINE    
    
    ; 곱하기 연산
    ; mul [레지스터]
    ; - mul bl => al * bl
    ; -- 연산 결과를 ax에 저장
    ; - mul bx => ax * bx
    ; -- 연산 결과는 dx(상위16비트) ax(하위16비트)에 저장
    
    ; ex) 5 * 8 은?
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    PRINT_DEC 2, ax ; 40나옴
    NEWLINE
    
    ; 나누기 연산
    ; div [레지스터]
    ; - div bl => ax / bl
    ; -- 연산 결과는 al(몫) ah(나머지)
    
    ; ex) 100 / 3은 ?
    mov ax, 100
    mov bl, 3
    div bl
    PRINT_DEC 1, al
    NEWLINE
    ;PRINT_DEC 1, ah는 print_dec안됨
    mov al, ah
    PRINT_DEC 1, al
    
    xor rax, rax
    ret
    
    
section .bss
    num resb 1