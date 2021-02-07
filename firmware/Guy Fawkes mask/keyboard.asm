
_keyboardInit:

;keyboard.c,12 :: 		void keyboardInit() {
;keyboard.c,13 :: 		HID_Enable(readbuff, writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;keyboard.c,14 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_keyboardInit0:
	DECFSZ      R13, 1, 1
	BRA         L_keyboardInit0
	DECFSZ      R12, 1, 1
	BRA         L_keyboardInit0
	DECFSZ      R11, 1, 1
	BRA         L_keyboardInit0
	NOP
	NOP
;keyboard.c,15 :: 		}
L_end_keyboardInit:
	RETURN      0
; end of _keyboardInit

_sendText:

;keyboard.c,17 :: 		void sendText(char* text) {
;keyboard.c,18 :: 		while( *text ) {
L_sendText1:
	MOVFF       FARG_sendText_text+0, FSR0
	MOVFF       FARG_sendText_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_sendText2
;keyboard.c,19 :: 		sendKey(*text);
	MOVFF       FARG_sendText_text+0, FSR0
	MOVFF       FARG_sendText_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_sendKey+0 
	CALL        _sendKey+0, 0
;keyboard.c,20 :: 		text++;
	INFSNZ      FARG_sendText_text+0, 1 
	INCF        FARG_sendText_text+1, 1 
;keyboard.c,21 :: 		}
	GOTO        L_sendText1
L_sendText2:
;keyboard.c,22 :: 		}
L_end_sendText:
	RETURN      0
; end of _sendText

_sendKey:

;keyboard.c,35 :: 		void sendKey(char value) {
;keyboard.c,37 :: 		uint8_t type = 0x00;
	CLRF        sendKey_type_L0+0 
	CLRF        sendKey_modifier_L0+0 
;keyboard.c,40 :: 		if ( iscntrl(value) )
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       FARG_iscntrl_character+0 
	CALL        _iscntrl+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey3
;keyboard.c,41 :: 		type = 0x01;
	MOVLW       1
	MOVWF       sendKey_type_L0+0 
	GOTO        L_sendKey4
L_sendKey3:
;keyboard.c,43 :: 		else if ( isalpha(value) ) {
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       FARG_isalpha_character+0 
	CALL        _isalpha+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey5
;keyboard.c,44 :: 		type = 0x02;
	MOVLW       2
	MOVWF       sendKey_type_L0+0 
;keyboard.c,45 :: 		if ( isupper(value) )
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       FARG_isupper_character+0 
	CALL        _isupper+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey6
;keyboard.c,46 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
	GOTO        L_sendKey7
L_sendKey6:
;keyboard.c,48 :: 		modifier = 0x00;
	CLRF        sendKey_modifier_L0+0 
L_sendKey7:
;keyboard.c,49 :: 		}
	GOTO        L_sendKey8
L_sendKey5:
;keyboard.c,51 :: 		else if ( isdigit(value) )
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey9
;keyboard.c,52 :: 		type = 0x03;
	MOVLW       3
	MOVWF       sendKey_type_L0+0 
	GOTO        L_sendKey10
L_sendKey9:
;keyboard.c,54 :: 		type = 0x04;
	MOVLW       4
	MOVWF       sendKey_type_L0+0 
L_sendKey10:
L_sendKey8:
L_sendKey4:
;keyboard.c,57 :: 		switch(type) {
	GOTO        L_sendKey11
;keyboard.c,58 :: 		case 0x01:
L_sendKey13:
;keyboard.c,59 :: 		if( value == '\r' || value == '\n' )  value = KEY_ENTER;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey122
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey122
	GOTO        L_sendKey16
L__sendKey122:
	MOVLW       40
	MOVWF       FARG_sendKey_value+0 
	GOTO        L_sendKey17
L_sendKey16:
;keyboard.c,60 :: 		else if( value == '\t' )              value = KEY_TAB;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey18
	MOVLW       43
	MOVWF       FARG_sendKey_value+0 
	GOTO        L_sendKey19
L_sendKey18:
;keyboard.c,61 :: 		else if( value == '\b' )              value = KEY_BACKSPACE;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey20
	MOVLW       42
	MOVWF       FARG_sendKey_value+0 
L_sendKey20:
L_sendKey19:
L_sendKey17:
;keyboard.c,62 :: 		break;
	GOTO        L_sendKey12
;keyboard.c,64 :: 		case 0x02:
L_sendKey21:
;keyboard.c,66 :: 		value = toupper(value);
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       FARG_toupper_character+0 
	CALL        _toupper+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,69 :: 		value = value - 'A' + KEY_A;
	MOVLW       65
	SUBWF       R0, 0 
	MOVWF       FARG_sendKey_value+0 
	MOVLW       4
	ADDWF       FARG_sendKey_value+0, 1 
;keyboard.c,70 :: 		break;
	GOTO        L_sendKey12
;keyboard.c,72 :: 		case 0x03:
L_sendKey22:
;keyboard.c,73 :: 		if ( value == '0' )
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey23
;keyboard.c,74 :: 		value = KEY_KP0;
	MOVLW       98
	MOVWF       FARG_sendKey_value+0 
	GOTO        L_sendKey24
L_sendKey23:
;keyboard.c,76 :: 		value = value - '1' + KEY_KP1;
	MOVLW       49
	SUBWF       FARG_sendKey_value+0, 1 
	MOVLW       89
	ADDWF       FARG_sendKey_value+0, 1 
L_sendKey24:
;keyboard.c,77 :: 		break;
	GOTO        L_sendKey12
;keyboard.c,79 :: 		case 0x04:
L_sendKey25:
;keyboard.c,80 :: 		if ( value == '-' || value == '_') {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey121
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       95
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey121
	GOTO        L_sendKey28
L__sendKey121:
;keyboard.c,81 :: 		if( value == '_') modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       95
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey29
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey29:
;keyboard.c,82 :: 		value = KEY_MINUS;
	MOVLW       45
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,83 :: 		}
	GOTO        L_sendKey30
L_sendKey28:
;keyboard.c,85 :: 		else if ( value == '+' || value == '=' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey120
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       61
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey120
	GOTO        L_sendKey33
L__sendKey120:
;keyboard.c,86 :: 		if( value == '=' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey34
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey34:
;keyboard.c,87 :: 		value = KEY_EQUAL;
	MOVLW       46
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,88 :: 		}
	GOTO        L_sendKey35
L_sendKey33:
;keyboard.c,90 :: 		else if ( value == '{' || value == '[' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       123
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey119
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       91
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey119
	GOTO        L_sendKey38
L__sendKey119:
;keyboard.c,91 :: 		if ( value == '{' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       123
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey39
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey39:
;keyboard.c,92 :: 		value = KEY_LEFTBRACE;
	MOVLW       47
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,93 :: 		}
	GOTO        L_sendKey40
L_sendKey38:
;keyboard.c,95 :: 		else if ( value == '}' || value == ']' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       125
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey118
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       93
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey118
	GOTO        L_sendKey43
L__sendKey118:
;keyboard.c,96 :: 		if ( value == '}' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       125
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey44
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey44:
;keyboard.c,97 :: 		value = KEY_RIGHTBRACE;
	MOVLW       48
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,98 :: 		}
	GOTO        L_sendKey45
L_sendKey43:
;keyboard.c,100 :: 		else if ( value == '\\' || value == '|' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       92
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey117
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       124
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey117
	GOTO        L_sendKey48
L__sendKey117:
;keyboard.c,101 :: 		if( value == '|' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       124
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey49
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey49:
;keyboard.c,102 :: 		value = KEY_BACKSLASH;
	MOVLW       49
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,103 :: 		}
	GOTO        L_sendKey50
L_sendKey48:
;keyboard.c,105 :: 		else if ( value == '\t' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey51
;keyboard.c,106 :: 		value = KEY_TAB;
	MOVLW       43
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,107 :: 		}
	GOTO        L_sendKey52
L_sendKey51:
;keyboard.c,109 :: 		else if( value == ':' || value == ';' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       58
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey116
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       59
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey116
	GOTO        L_sendKey55
L__sendKey116:
;keyboard.c,110 :: 		if ( value == ':' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       58
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey56
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey56:
;keyboard.c,111 :: 		value = KEY_SEMICOLON;
	MOVLW       51
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,112 :: 		}
	GOTO        L_sendKey57
L_sendKey55:
;keyboard.c,114 :: 		else if( value == '\'' || value == '"' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       39
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey115
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       34
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey115
	GOTO        L_sendKey60
L__sendKey115:
;keyboard.c,115 :: 		if ( value == '"' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       34
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey61
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey61:
;keyboard.c,116 :: 		value = KEY_APOSTROPHE;
	MOVLW       52
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,117 :: 		}
	GOTO        L_sendKey62
L_sendKey60:
;keyboard.c,119 :: 		else if( value == '`' || value == '~' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       96
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey114
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       126
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey114
	GOTO        L_sendKey65
L__sendKey114:
;keyboard.c,120 :: 		if ( value == '~' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       126
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey66
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey66:
;keyboard.c,121 :: 		value = KEY_GRAVE;
	MOVLW       53
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,122 :: 		}
	GOTO        L_sendKey67
L_sendKey65:
;keyboard.c,124 :: 		else if( value == ',' || value == '<' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       44
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey113
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       60
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey113
	GOTO        L_sendKey70
L__sendKey113:
;keyboard.c,125 :: 		if ( value == '<' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey71
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey71:
;keyboard.c,126 :: 		value = KEY_COMMA;
	MOVLW       54
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,127 :: 		}
	GOTO        L_sendKey72
L_sendKey70:
;keyboard.c,129 :: 		else if( value == '.' || value == '>' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       46
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey112
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       62
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey112
	GOTO        L_sendKey75
L__sendKey112:
;keyboard.c,130 :: 		if ( value == '>' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       62
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey76
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey76:
;keyboard.c,131 :: 		value = KEY_DOT;
	MOVLW       55
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,132 :: 		}
	GOTO        L_sendKey77
L_sendKey75:
;keyboard.c,134 :: 		else if( value == '/' || value == '?' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey111
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       63
	BTFSC       STATUS+0, 2 
	GOTO        L__sendKey111
	GOTO        L_sendKey80
L__sendKey111:
;keyboard.c,135 :: 		if ( value == '?' ) modifier = KEY_MOD_LSHIFT;
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey81
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
L_sendKey81:
;keyboard.c,136 :: 		value = KEY_SLASH;
	MOVLW       56
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,137 :: 		}
	GOTO        L_sendKey82
L_sendKey80:
;keyboard.c,139 :: 		else if ( value == '!' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       33
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey83
;keyboard.c,140 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,141 :: 		value = KEY_1;
	MOVLW       30
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,142 :: 		}
	GOTO        L_sendKey84
L_sendKey83:
;keyboard.c,144 :: 		else if( value == '@' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       64
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey85
;keyboard.c,145 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,146 :: 		value = KEY_2;
	MOVLW       31
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,147 :: 		}
	GOTO        L_sendKey86
L_sendKey85:
;keyboard.c,149 :: 		else if( value == '#' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       35
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey87
;keyboard.c,150 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,151 :: 		value = KEY_3;
	MOVLW       32
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,152 :: 		}
	GOTO        L_sendKey88
L_sendKey87:
;keyboard.c,154 :: 		else if( value == '$' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey89
;keyboard.c,155 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,156 :: 		value = KEY_4;
	MOVLW       33
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,157 :: 		}
	GOTO        L_sendKey90
L_sendKey89:
;keyboard.c,159 :: 		else if( value == '%' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       37
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey91
;keyboard.c,160 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,161 :: 		value = KEY_5;
	MOVLW       34
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,162 :: 		}
	GOTO        L_sendKey92
L_sendKey91:
;keyboard.c,163 :: 		else if( value == '^' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       94
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey93
;keyboard.c,164 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,165 :: 		value = KEY_6;
	MOVLW       35
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,166 :: 		}
	GOTO        L_sendKey94
L_sendKey93:
;keyboard.c,168 :: 		else if( value == '&' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       38
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey95
;keyboard.c,169 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,170 :: 		value = KEY_7;
	MOVLW       36
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,171 :: 		}
	GOTO        L_sendKey96
L_sendKey95:
;keyboard.c,173 :: 		else if( value == '*' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey97
;keyboard.c,174 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,175 :: 		value = KEY_8;
	MOVLW       37
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,176 :: 		}
	GOTO        L_sendKey98
L_sendKey97:
;keyboard.c,178 :: 		else if( value == '(' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       40
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey99
;keyboard.c,179 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,180 :: 		value = KEY_9;
	MOVLW       38
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,181 :: 		}
	GOTO        L_sendKey100
L_sendKey99:
;keyboard.c,183 :: 		else if( value == ')' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       41
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey101
;keyboard.c,184 :: 		modifier = KEY_MOD_LSHIFT;
	MOVLW       2
	MOVWF       sendKey_modifier_L0+0 
;keyboard.c,185 :: 		value = KEY_0;
	MOVLW       39
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,186 :: 		}
	GOTO        L_sendKey102
L_sendKey101:
;keyboard.c,188 :: 		else if( value == ' ' ) {
	MOVF        FARG_sendKey_value+0, 0 
	XORLW       32
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey103
;keyboard.c,189 :: 		value = KEY_SPACE;
	MOVLW       44
	MOVWF       FARG_sendKey_value+0 
;keyboard.c,190 :: 		}
L_sendKey103:
L_sendKey102:
L_sendKey100:
L_sendKey98:
L_sendKey96:
L_sendKey94:
L_sendKey92:
L_sendKey90:
L_sendKey88:
L_sendKey86:
L_sendKey84:
L_sendKey82:
L_sendKey77:
L_sendKey72:
L_sendKey67:
L_sendKey62:
L_sendKey57:
L_sendKey52:
L_sendKey50:
L_sendKey45:
L_sendKey40:
L_sendKey35:
L_sendKey30:
;keyboard.c,191 :: 		break;
	GOTO        L_sendKey12
;keyboard.c,193 :: 		default:
L_sendKey104:
;keyboard.c,194 :: 		break;
	GOTO        L_sendKey12
;keyboard.c,195 :: 		}
L_sendKey11:
	MOVF        sendKey_type_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey13
	MOVF        sendKey_type_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey21
	MOVF        sendKey_type_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey22
	MOVF        sendKey_type_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_sendKey25
	GOTO        L_sendKey104
L_sendKey12:
;keyboard.c,199 :: 		writebuff[0] = modifier;  // Modifier
	MOVF        sendKey_modifier_L0+0, 0 
	MOVWF       1344 
;keyboard.c,200 :: 		writebuff[1] = 0x00;      // Reserved
	CLRF        1345 
;keyboard.c,201 :: 		writebuff[2] = value;
	MOVF        FARG_sendKey_value+0, 0 
	MOVWF       1346 
;keyboard.c,202 :: 		writebuff[3] = 0x00;
	CLRF        1347 
;keyboard.c,203 :: 		writebuff[4] = 0x00;
	CLRF        1348 
;keyboard.c,204 :: 		writebuff[5] = 0x00;
	CLRF        1349 
;keyboard.c,205 :: 		writebuff[6] = 0x00;
	CLRF        1350 
;keyboard.c,206 :: 		writebuff[7] = 0x00;
	CLRF        1351 
;keyboard.c,207 :: 		while( !HID_Write(writebuff,8) );
L_sendKey105:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey106
	GOTO        L_sendKey105
L_sendKey106:
;keyboard.c,208 :: 		Delay_ms(30);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       133
	MOVWF       R13, 0
L_sendKey107:
	DECFSZ      R13, 1, 1
	BRA         L_sendKey107
	DECFSZ      R12, 1, 1
	BRA         L_sendKey107
	DECFSZ      R11, 1, 1
	BRA         L_sendKey107
;keyboard.c,211 :: 		writebuff[0] = 0x00;  // Modifier
	CLRF        1344 
;keyboard.c,212 :: 		writebuff[2] = 0x00;
	CLRF        1346 
;keyboard.c,213 :: 		while( !HID_Write(writebuff,8) );
L_sendKey108:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       8
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_sendKey109
	GOTO        L_sendKey108
L_sendKey109:
;keyboard.c,214 :: 		Delay_ms(30);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       133
	MOVWF       R13, 0
L_sendKey110:
	DECFSZ      R13, 1, 1
	BRA         L_sendKey110
	DECFSZ      R12, 1, 1
	BRA         L_sendKey110
	DECFSZ      R11, 1, 1
	BRA         L_sendKey110
;keyboard.c,215 :: 		}
L_end_sendKey:
	RETURN      0
; end of _sendKey
