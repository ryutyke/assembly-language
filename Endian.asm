%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    PRINT_STRING msg  ;PRINT_STRING은 어셈블리언어는 아님 SASM이 지원하는 명령어
    
    xor rax, rax
    ret
    
    
section .data
    msg db "Hello World", 0x00
    ;문자 하나하나, 마지막에 0x00 이렇게 12byte 들어간거임
    ;문자를 아스키코드로 16진수로 변환. 0x00은 아스키코드에서 Nul
    ;2진수로 넣든 16진수로 넣든 10진수로 넣든 다 변환이 됨 컴퓨터는 최종적으로 2진수로 저장하겠지
    ;그걸 print_string이 아스키코드에 맞춰서 문자로 변환시켜서 보여주는거고
    
    b dd 0x12345678 ; 디버그해서 byte 크기로 메모리 분석해보면 0x78, 0x56, 0x34, 0x12 이렇게 저장되어 있음
                    ; 87654321이 아니라 왜 78563412인가 => 최소단위가 1바이트
                    ; Little-Endian 때문, little인지 big 인지는 cpu에 의해 결정
                    ; 각자 장단점이 있음 ex 연산 형변환 숫자비교 가독성 등
                    ; 네트워크에서 엔디안 방식 차이를 고려해야함