%include "io64.inc"

section .text
global CMAIN
CMAIN:
    
    call PRINT_MSG
    
    mov eax, 10
    mov ebx, 15
    call MAX
    PRINT_DEC 4, ecx
    NEWLINE
    
    xor rax, rax
    ret
    
PRINT_MSG:
    PRINT_STRING msg
    NEWLINE
    ret
    
; 두 값중 더 큰 값을 반환하는 MAX 함수
; eax와 ebx 중 큰 값을 ecx에 복사
MAX:
    cmp eax, ebx
    jg L1
    mov ecx, ebx
    jmp L2
L1:
    mov ecx, eax
L2:
    ret
    
    ; 해당 방식의 문제점
    ; 인자가 10개라면 어떻게 할까? a b c d ...
    ; eax, ebx에 이미 중요한 값이 있다면 어떻게 할까?
    ; 즉 레지스터만을 사용하기엔 좋지 않음 => data bss 사용? 그래도 함수가 많아질수록 인자 수가 너무 많아짐
    
    ; 레지스터, data, bss 말고 다른 메모리 구조가 필요하다
    ; - 함수가 실행되는 도중에는 메모리가 유효하다 (유효 범위의 개념이 있다)
    ; - 함수가 끝나서 필요없어지면 없애도 됨 (정리의 개념이 있다)
    ; - 함수 속에서 또 다른 함수로 들어가는 경우 (유동적으로 유효 범위가 확장 가능하다)
    
    ; 해결책 : 스택(stack) 메모리 사용
    ; - 매개 변수 전달
    ; - 돌아갈 주소 관리      
            
                
section .data
    msg db 'Hello World', 0x00