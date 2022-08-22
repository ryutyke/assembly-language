%include "io64.inc"

section .text
global CMAIN
CMAIN:
    
    ; 쉬프트(shift) 연산, 논리(logical) 연산
    
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    
    ; 곱셈 나눗셈 빠르게 가능
    ; 게임서버에서 ObjectID를 만들어줄 때처럼 곱/나 외에도 유용하게 쓰이는 경우가 있음
    
    ; not and or xor
    ; not -> 0이면 1, 1이면 0
    ; and -> 둘다 1이면 1, 아니면 0
    ; or -> 둘중 하나라도 1이면 1, 아니면 0
    ; xor -> 둘다 1이거나 둘다 0이면 0, 아니면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    ; 0b00010100 = 0x14
    and al, bl ; al = al and bl
    PRINT_HEX 1, al
    NEWLINE
    
    ; 0b11101011 = 0xeb
    not al
    PRINT_HEX 1, al
    NEWLINE
    
    ; 응용 사례 : bitflag => flag 어떤 변수 0 1로 남자인지 여자인지 이런거 설정하는거
    
    mov al, 0b10010101
    mov bl, 0b01111100
    NEWLINE
    PRINT_HEX 1, al
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    ; 동일한 값으로 xor 두번하면 자기 자신으로 되돌아오는 특성
    ; 암호학에서 유용 (value xor key) 암호화키로 xor시켜서 암호화 시키고 나중에 다시 암호화키로 xor시켜서 복구
    
    ; xor rax, rax => 자기 자신으로 하면 0이 됨. 계산 빠름
    xor rax, rax
    ret 