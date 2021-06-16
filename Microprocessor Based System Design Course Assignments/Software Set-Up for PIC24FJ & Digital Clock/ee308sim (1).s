.title "EE308 PIC24F Board"
.sbttl "Initialization Code"
.equ __24FJ256GB110, 1
.include "p24FJ256GB110.inc"

config __CONFIG1, JTAGEN_OFF    
    
.global __reset          ;The label for the first line of code. 
.global __T1Interrupt    ;Declare Timer 1 ISR name global

.bss

.section .const,psv

.text		  ;Start of Code section
__reset:
    mov	    #__SP_init, W15	; Initalize the Stack Pointer
    mov	    #__SPLIM_init, W0	; Initialize the Stack Pointer Limit Register
    mov	    W0, SPLIM
    nop				; Add NOP to follow SPLIM initialization
    
    mov	    #0x0000, W0
    mov	    W0, TRISB		; all port-B pins output
    mov	    #0xFFFF, W0
    mov	    W0, AD1PCFGL
    
    mov	    #0x0000, W0		; time counter start value
    mov	    #0x7FF8, W1		; 1 sn delay clock count
    mov	    #0x0000, W2		; clock counter initial
    mov	    #0x2400, W3		; day roll-over constant
    mov	    #0x60, W6		; minute roll-over constant
    
main_loop:
    
    DAW.B   W0
    BRA	    C, carrying
    CPSNE   W0,W3
    CLR	    W0
    CPSNE   W0,W6
    ADD	    #0x00A0,W0
    CPSNE   W2,W1
    CLR	    W2
    INC	    W2,W2
    MOV W0, TRISB
    BRA main_loop
    
carrying:
    MOV #0xFF00, W5
    AND W0, W5, W4
    ASR W4, #8 , W4
    INC W4,W4
    DAW.B W4
    SL  W4,#8,W4
    MOV.B #0xFF,W5
    AND.B W0,W5,W4
    mov W4,W0
    BRA main_loop
    
    
    .end
    