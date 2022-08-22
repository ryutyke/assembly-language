%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ; 분기문 (if)
    ; 조건 -> 흐름
    
    ; CMP dst, src (dst가 기준) CMP -> compare
    ; 비교를 한 결과물은 Flag Register에 저장됨
    
    ; JMP [label] 시리즈
    ; JMP : 무조건 jump
    ; JE : JumpEquals 같으면 jump
    ; JNE : JumpNotEquals 다르면 jump
    ; JG : JumpGreater 크면 jump
    ; JGE : JumpGreaterEqual 크거나 같으면 jump
    ; JL
    ; JLE
    
    ; 두 숫자가 같으면 1, 아니면 0을 출력하는 프로그램
    
    mov rax, 10
    mov rbx, 10
    
    cmp rax, rbx  ;[ PF ZF IF ]  이런식으로 ZF -> ZeroFlag 등 flag 레지스터에 기록됨
    
    je LABEL_EQUAL
    
    ; je에 의해 점프를 안했다면, 같지 않다는 의미
    mov rcx, 0
    jmp LABEL_EQUAL_END
    
LABEL_EQUAL:
    mov rcx, 1
LABEL_EQUAL_END:
    PRINT_HEX 1, rcx ; 같으면 1 아니면 0
    NEWLINE
    
    ;
    ;
    ; 어떤 숫자(1~100)가 짝수면 1, 홀수면 0을 출력하는 프로그램
    mov ax, 99
    ;나누기 연산
    ; div reg
    ; - div bl => ax / bl (al몫 ah나머지)
    
    mov bl, 2
    div bl
    cmp ah, 0
    je Even_Number
    mov rcx, 0
    jmp Odd_Number
Even_Number:
    mov rcx, 1
Odd_Number:
    PRINT_HEX 1, rcx
    NEWLINE

    xor rax, rax
    ret