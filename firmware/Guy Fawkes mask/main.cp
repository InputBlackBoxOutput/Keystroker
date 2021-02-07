#line 1 "C:/Users/admin/Desktop/Github/Keystroker/firmware/Guy Fawkes/main.c"
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
#line 10 "C:/Users/admin/Desktop/Github/Keystroker/firmware/Guy Fawkes/main.c"
void interrupt() {
 USB_Interrupt_Proc();
}


void main() {
 keyboardInit();
 Delay_ms(2000);

 sendText("        .:+oooooooooooooooooooo+:.        \r");
 sendText("    -ooo+:.                    .:+ooo-    \r");
 sendText("   ss.                              .ss   \r");
 sendText("  .N      ..                  ..      N.  \r");
 sendText("  :h /yyyyoo+oo:.        .:oo+ooyyyy/ h:  \r");
 sendText("  ossd+:-:+oo:-:oo-    -oo:.:oo/:-:+dsso  \r");
 sendText("  y+-        :oo/do    oy/oo:        -+y  \r");
 sendText("  h+.    .......:os.    .:.......    .+h  \r");
 sendText("  d+y/:/yo++/+oy: :d     :yo+/++oy/:/y+d  \r");
 sendText("  m. ---/++++++/.  m.    ./++++++/--- .m  \r");
 sendText("  m.               d:                 .m  \r");
 sendText("  d-               y/                 -d  \r");
 sendText("  os/         -    s+      -         /so  \r");
 sendText("  .mso/::://oom .- :-   -. moo//:::/osm.  \r");
 sendText("   +y :dyd/.  /oymy/--/ymho/  ./dyd: y+   \r");
 sendText("    y+  yyy+//::ss.:yy:.ss:://+yyy  +y    \r");
 sendText("     h/  +sso+++/-:y++y:-/++ooss+  /h     \r");
 sendText("     .h:   ..--:shho//ohhy:--..   /h.     \r");
 sendText("       y+       .sysssshs.       +y       \r");
 sendText("        +y.      .ss  ss.      .y+        \r");
 sendText("         -yo      y/  /y      oy-         \r");
 sendText("           :y+    h:  :h    +y:           \r");
 sendText("             :so- +s  s+ -ss:             \r");
 sendText("               .+osmoomso+.               \r");


 sendText("\r");
 sendText("\r");
 sendText("You have been hacked! ;-)\r");
}
