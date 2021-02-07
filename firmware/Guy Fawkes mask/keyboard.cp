#line 1 "C:/Users/admin/Desktop/Github/Keystroker/firmware/Guy Fawkes/keyboard.c"
#line 1 "c:/users/admin/desktop/github/keystroker/firmware/guy fawkes/keyboard.h"
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
#line 1 "c:/users/admin/desktop/github/keystroker/firmware/guy fawkes/hut.h"
#line 14 "c:/users/admin/desktop/github/keystroker/firmware/guy fawkes/keyboard.h"
void keyboardInit( void );

void sendText( char*);

void sendKey ( char );
#line 9 "C:/Users/admin/Desktop/Github/Keystroker/firmware/Guy Fawkes/keyboard.c"
uint8_t readbuff[64] absolute 0x500;
uint8_t writebuff[64] absolute 0x540;

void keyboardInit() {
 HID_Enable(readbuff, writebuff);
 Delay_ms(1000);
}

void sendText(char* text) {
 while( *text ) {
 sendKey(*text);
 text++;
 }
}
#line 35 "C:/Users/admin/Desktop/Github/Keystroker/firmware/Guy Fawkes/keyboard.c"
void sendKey(char value) {

 uint8_t type = 0x00;
 uint8_t modifier = 0x00;

 if ( iscntrl(value) )
 type = 0x01;

 else if ( isalpha(value) ) {
 type = 0x02;
 if ( isupper(value) )
 modifier =  0x02 ;
 else
 modifier = 0x00;
 }

 else if ( isdigit(value) )
 type = 0x03;
 else
 type = 0x04;


 switch(type) {
 case 0x01:
 if( value == '\r' || value == '\n' ) value =  0x28 ;
 else if( value == '\t' ) value =  0x2b ;
 else if( value == '\b' ) value =  0x2a ;
 break;

 case 0x02:

 value = toupper(value);


 value = value - 'A' +  0x04 ;
 break;

 case 0x03:
 if ( value == '0' )
 value =  0x62 ;
 else
 value = value - '1' +  0x59 ;
 break;

 case 0x04:
 if ( value == '-' || value == '_') {
 if( value == '_') modifier =  0x02 ;
 value =  0x2d ;
 }

 else if ( value == '+' || value == '=' ) {
 if( value == '=' ) modifier =  0x02 ;
 value =  0x2e ;
 }

 else if ( value == '{' || value == '[' ) {
 if ( value == '{' ) modifier =  0x02 ;
 value =  0x2f ;
 }

 else if ( value == '}' || value == ']' ) {
 if ( value == '}' ) modifier =  0x02 ;
 value =  0x30 ;
 }

 else if ( value == '\\' || value == '|' ) {
 if( value == '|' ) modifier =  0x02 ;
 value =  0x31 ;
 }

 else if ( value == '\t' ) {
 value =  0x2b ;
 }

 else if( value == ':' || value == ';' ) {
 if ( value == ':' ) modifier =  0x02 ;
 value =  0x33 ;
 }

 else if( value == '\'' || value == '"' ) {
 if ( value == '"' ) modifier =  0x02 ;
 value =  0x34 ;
 }

 else if( value == '`' || value == '~' ) {
 if ( value == '~' ) modifier =  0x02 ;
 value =  0x35 ;
 }

 else if( value == ',' || value == '<' ) {
 if ( value == '<' ) modifier =  0x02 ;
 value =  0x36 ;
 }

 else if( value == '.' || value == '>' ) {
 if ( value == '>' ) modifier =  0x02 ;
 value =  0x37 ;
 }

 else if( value == '/' || value == '?' ) {
 if ( value == '?' ) modifier =  0x02 ;
 value =  0x38 ;
 }

 else if ( value == '!' ) {
 modifier =  0x02 ;
 value =  0x1e ;
 }

 else if( value == '@' ) {
 modifier =  0x02 ;
 value =  0x1f ;
 }

 else if( value == '#' ) {
 modifier =  0x02 ;
 value =  0x20 ;
 }

 else if( value == '$' ) {
 modifier =  0x02 ;
 value =  0x21 ;
 }

 else if( value == '%' ) {
 modifier =  0x02 ;
 value =  0x22 ;
 }
 else if( value == '^' ) {
 modifier =  0x02 ;
 value =  0x23 ;
 }

 else if( value == '&' ) {
 modifier =  0x02 ;
 value =  0x24 ;
 }

 else if( value == '*' ) {
 modifier =  0x02 ;
 value =  0x25 ;
 }

 else if( value == '(' ) {
 modifier =  0x02 ;
 value =  0x26 ;
 }

 else if( value == ')' ) {
 modifier =  0x02 ;
 value =  0x27 ;
 }

 else if( value == ' ' ) {
 value =  0x2c ;
 }
 break;

 default:
 break;
 }



 writebuff[0] = modifier;
 writebuff[1] = 0x00;
 writebuff[2] = value;
 writebuff[3] = 0x00;
 writebuff[4] = 0x00;
 writebuff[5] = 0x00;
 writebuff[6] = 0x00;
 writebuff[7] = 0x00;
 while( !HID_Write(writebuff,8) );
 Delay_ms(30);


 writebuff[0] = 0x00;
 writebuff[2] = 0x00;
 while( !HID_Write(writebuff,8) );
 Delay_ms(30);
}
