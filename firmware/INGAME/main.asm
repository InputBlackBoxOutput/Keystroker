
_interrupt:

;main.c,10 :: 		void interrupt() {
;main.c,11 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;main.c,12 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;main.c,15 :: 		void main() {
;main.c,16 :: 		keyboardInit();
	CALL        _keyboardInit+0, 0
;main.c,17 :: 		while(1) {
L_main0:
;main.c,18 :: 		sendText("INGAME\r");
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_sendText+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_sendText+1 
	CALL        _sendText+0, 0
;main.c,19 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;main.c,20 :: 		}
	GOTO        L_main0
;main.c,22 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
