/*
*  File Name: keyboard.h
*  Description: Provides keyboard emulation
*  Created on 5 Oct 2019
*/

#ifndef KEYPRESS_EMUL_H
#define KEYPRESS_EMUL_H

#include <stdint.h>
#include "hut.h"

// Function to initialize device as USB HID Keyboard
void keyboardInit( void );
// Function to send multiple keys to pc
void sendText( char*);
// Function to send a key to the pc
void sendKey ( char );

#endif // KEYPRESS_EMUL_H

//////////////////////////////////////////////////////////////////////////////////////////