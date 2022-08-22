%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging

    ; 8 bit = 1 byte
    ; 16 bit = 2 byte = 1 word
    ; 32 bit = 4 byte = 1 dword (double-word)
    ; 64 bit = 8 byte = 1 qword (quad-word)
    
    
    ; Register Set는 cpu 안에 있는 저장소. 메인 메모리, 하드디스크 보다 cpu와 가까워서 되게 빠름
    ; cpu가 임시적으로 사용함
    
    ; rax(64bit) eax(32bit) ax(16bit) ah(앞 8bit) al(뒤 8bit)
    ; rax rbx rcx rdx eax ebx ecx edx 이런식
    
    mov eax, 0x1234
    mov rbx, 0x12345678
    mov cl, 0xff
    
    mov al, 0x00
    
    ;mov rax, a    ;a의 주소값을 rax에 넣음
    ;mov rax, [a]  ;a의 값을 rax에 넣음 rax는 64bit라 a부터 시작해서 64bit만큼 다 가져옴
    
    mov al, [a]    ;al과 같이 작은 사이즈를 이용해서 원하는 만큼만 복사할 수 있음
    
    mov [a], byte 0x35 ;이렇게 상수도 넣어줄 수 있음. 크기를 써주는 이유는
    mov [a], word 0x35 ;이거는 0x35가 아니라 0x0035가 됨. 즉 0이 생략되어 있는 것
    mov [a], cl        ;cl은 사이즈가 정해져있기에 지정 안해줘도 됨. 
    
    xor rax, rax
    ret
    
; 초기화 된 데이터
; [변수이름] [크기] [초기값]
; [크기] db(1) dw(2) dd(4) dq(8)   
section .data
    a db 0x11
    b dw 0x2222
    c dd 0x33333333
    d dq 0x4444444444444444
    
    
; 초기화 되지 않은 데이터
; [변수이름] [크기] [개수]
; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    e resb 10

