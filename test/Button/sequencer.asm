
_main:

;sequencer.c,10 :: 		void main() {
;sequencer.c,12 :: 		TRISB |= 1 << BTN;
	BSF         TRISB+0, 4 
;sequencer.c,13 :: 		TRISA = 0x07;
	MOVLW       7
	MOVWF       TRISA+0 
;sequencer.c,15 :: 		LATA = 0x00;
	CLRF        LATA+0 
;sequencer.c,17 :: 		while(1) {
L_main0:
;sequencer.c,23 :: 		}
L_main2:
;sequencer.c,24 :: 		if(oldState == 1) {
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       1
	XORWF       R1, 0 
L__main14:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;sequencer.c,26 :: 		LATA &=~ (1 << LED_R || 1 << LED_Y || 1 << LED_G );
	MOVLW       254
	ANDWF       LATA+0, 1 
;sequencer.c,29 :: 		LATA |= 1 << LED_G;
	BSF         LATA+0, 2 
;sequencer.c,30 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;sequencer.c,32 :: 		LATA |= 1 << LED_Y;
	BSF         LATA+0, 1 
;sequencer.c,33 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;sequencer.c,35 :: 		LATA |= 1 << LED_R;
	BSF         LATA+0, 0 
;sequencer.c,36 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;sequencer.c,37 :: 		}
	GOTO        L_main9
L_main5:
;sequencer.c,40 :: 		LATA &=~ (1 << LED_R || 1 << LED_Y || 1 << LED_G );
	MOVLW       254
	ANDWF       LATA+0, 1 
;sequencer.c,43 :: 		LATA |= 1 << LED_R;
	BSF         LATA+0, 0 
;sequencer.c,44 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;sequencer.c,46 :: 		LATA |= 1 << LED_Y;
	BSF         LATA+0, 1 
;sequencer.c,47 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;sequencer.c,49 :: 		LATA |= 1 << LED_G;
	BSF         LATA+0, 2 
;sequencer.c,50 :: 		Delay_ms(ON_DELAY);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;sequencer.c,51 :: 		}
L_main9:
;sequencer.c,52 :: 		}
	GOTO        L_main0
;sequencer.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
