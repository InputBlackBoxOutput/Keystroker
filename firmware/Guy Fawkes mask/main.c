/*
*  File Name:main.c
*  Description:Manages all activites of the main controller board.
*  Created on 5 Feb 2020
*/

#include "keyboard.h"

//USB Interrupt Service Routine
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