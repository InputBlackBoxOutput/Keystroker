// Connect as keyboard and send key strokes for Guy Fawkes mask ASCII art
// Written by Rutuparn Pawar (InputBlackBoxOutput)
// Created 9 Feb 2020

// Caution: Connect a switch to cut the power in case of an emergency


#include <Keyboard.h>

void setup() {
  Keyboard.begin();
}

void loop() {
  delay(1000);
  
  Keyboard.print("          .:+oooooooooooooooooooo+:.          \n");
  Keyboard.print("      -ooo+:.                    .:+ooo-      \n");
  Keyboard.print("     ss.                              .ss     \n");
  Keyboard.print("    .N      ..                  ..      N.    \n");
  Keyboard.print("    :h /yyyyoo+oo:.        .:oo+ooyyyy/ h:    \n");
  Keyboard.print("    ossd+:-:+oo:-:oo-    -oo:.:oo/:-:+dsso    \n");
  Keyboard.print("    y+-        :oo/do    oy/oo:        -+y    \n");
  Keyboard.print("    h+.    .......:os.    .:.......    .+h    \n");
  Keyboard.print("    d+y/:/yo++/+oy: :d     :yo+/++oy/:/y+d    \n");
  Keyboard.print("    m. ---/++++++/.  m.    ./++++++/--- .m    \n");
  Keyboard.print("    m.               d:                 .m    \n");
  Keyboard.print("    d-               y/                 -d    \n");
  Keyboard.print("    os/         -    s+      -         /so    \n");
  Keyboard.print("    .mso/::://oom .- :-   -. moo//:::/osm.    \n");
  Keyboard.print("     +y :dyd/.  /oymy/--/ymho/  ./dyd: y+     \n");
  Keyboard.print("      y+  yyy+//::ss.:yy:.ss:://+yyy  +y      \n");
  Keyboard.print("       h/  +sso+++/-:y++y:-/++ooss+  /h       \n");
  Keyboard.print("       .h:   ..--:shho//ohhy:--..   /h.       \n");
  Keyboard.print("         y+       .sysssshs.       +y         \n");
  Keyboard.print("          +y.      .ss  ss.      .y+          \n");
  Keyboard.print("           -yo      y/  /y      oy-           \n");
  Keyboard.print("             :y+    h:  :h    +y:             \n");
  Keyboard.print("               :so- +s  s+ -ss:               \n");
  Keyboard.print("                 .+osmoomso+.                 \n\n\n");

  delay(1000);
  Keyboard.print("You ");
  delay(500);
  Keyboard.print("have ");
  delay(500);
  Keyboard.print("been ");
  delay(500);
  Keyboard.print("hacked!\n\n");

  delay(5000);
  Keyboard.print("Just kidding.\n\n");

  while(1);
}


/*
// Place cursor here while uploading or get ready to face the wrath of the keystroker ;-)



*/


