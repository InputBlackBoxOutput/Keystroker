/*
*  File Name:main.c
*  Description:Manages all activites of the main controller board.
*  Created on 12 Oct 2019
*/

#include "keyboard.h"

//USB Interrupt Service Routine
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