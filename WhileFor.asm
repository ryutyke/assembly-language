%include "io64.inc"

section .text
global CMAIN
CMAIN:

    ; 반복문 (while for)
    
    mov ecx, 10
    
LABEL_LOOP:
    PRINT_STRING msg
    NEWLINE
    dec ecx ; ecx--
    cmp ecx, 0
    jne LABEL_LOOP
    
    ; 1에서 100까지 합을 구하는 프로그램
    mov eax, 0 ; mov eax, eax
    mov ebx, 100
    
LABEL_LOOP2:
    add eax, ebx
    dec ebx
    cmp ebx, 0
    jne LABEL_LOOP2
    
    PRINT_DEC 4, eax

    ; loop!
    ; 사용법: loop [라벨]
    ; - ecx에 반복 횟수 지정
    ; - loop 할때마다 ecx 1 감소, 0이면 빠져나감. 아니면 라벨로 이동

    mov ecx, 100
    mov ebx, ebx
LABEL_LOOP_SUM:
    add ebx, ecx
    loop LABEL_LOOP_SUM
    
    
    xor rax, rax
    ret
    
    
section .data
    msg db 'Hello World', 0x00