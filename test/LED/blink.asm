
_main:

;blink.c,7 :: 		void main() {
;blink.c,8 :: 		TRISA = 0;
	CLRF        TRISA+0 
;blink.c,10 :: 		while(1){
L_main0:
;blink.c,11 :: 		LATA |= 1 << LED_R || 1 << LED_Y || 1 << LED_G;
	BSF         LATA+0, 0 
;blink.c,12 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
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
;blink.c,13 :: 		LATA &=~(1 << LED_R || 1 << LED_Y || 1 << LED_G);
	MOVLW       254
	ANDWF       LATA+0, 1 
;blink.c,14 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;blink.c,16 :: 		};
	GOTO        L_main0
;blink.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
