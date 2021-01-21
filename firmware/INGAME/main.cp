#line 1 "C:/Users/admin/Desktop/Github/Keystroker/firmware/INGAME/main.c"
#line 1 "c:/users/admin/desktop/github/keystroker/firmware/ingame/keyboard.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "c:/users/admin/desktop/github/keystroker/firmware/ingame/hut.h"
#line 14 "c:/users/admin/desktop/github/keystroker/firmware/ingame/keyboard.h"
void keyboardInit( void );

void sendText( char*);

void sendKey ( char );
#line 10 "C:/Users/admin/Desktop/Github/Keystroker/firmware/INGAME/main.c"
void interrupt() {
 USB_Interrupt_Proc();
}


void main() {
 keyboardInit();
 while(1) {
 sendText("INGAME\r");
 Delay_ms(2000);
 }

}
