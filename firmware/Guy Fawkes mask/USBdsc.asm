
_USB_Init_Desc:

;USBdsc.c,188 :: 		void USB_Init_Desc(){
;USBdsc.c,189 :: 		USB_config_dsc_ptr[0] = &configDescriptor1;
	MOVLW       _configDescriptor1+0
	MOVWF       _USB_config_dsc_ptr+0 
	MOVLW       hi_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+1 
	MOVLW       higher_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+2 
;USBdsc.c,190 :: 		USB_string_dsc_ptr[0] = (const char*)&strd1;
	MOVLW       _strd1+0
	MOVWF       _USB_string_dsc_ptr+0 
	MOVLW       hi_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+1 
	MOVLW       higher_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+2 
;USBdsc.c,191 :: 		USB_string_dsc_ptr[1] = (const char*)&strd2;
	MOVLW       _strd2+0
	MOVWF       _USB_string_dsc_ptr+3 
	MOVLW       hi_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+4 
	MOVLW       higher_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+5 
;USBdsc.c,192 :: 		USB_string_dsc_ptr[2] = (const char*)&strd3;
	MOVLW       _strd3+0
	MOVWF       _USB_string_dsc_ptr+6 
	MOVLW       hi_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+7 
	MOVLW       higher_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+8 
;USBdsc.c,193 :: 		}
L_end_USB_Init_Desc:
	RETURN      0
; end of _USB_Init_Desc
