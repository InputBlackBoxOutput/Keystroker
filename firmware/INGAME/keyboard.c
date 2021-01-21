/*
*  File Name: keyboard.c
*  Description: Provides keyboard emulation
*  Created on 5 Oct 2019
*/

#include "keyboard.h"

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

/*
*  Types and modifiers for keystrokes
*
*  modifier = Left shift for uppercase 
*  modifier = 0x00       for lowercase or no case
*
*  type = 1 Control or delete characters
*  type = 2 Alphabet characters
*  type = 3 Numeric characters
*  type = 4 Special characters
*/
void sendKey(char value) {

  uint8_t type = 0x00;
  uint8_t modifier = 0x00;

  if ( iscntrl(value) )
    type = 0x01;
  
  else if ( isalpha(value) ) {
    type = 0x02;
    if ( isupper(value) )
      modifier = KEY_MOD_LSHIFT;
    else
      modifier = 0x00;
  }

  else if ( isdigit(value) )
    type = 0x03;
  else
    type = 0x04;


  switch(type) {
    case 0x01:
      if( value == '\r' || value == '\n' )  value = KEY_ENTER;
      else if( value == '\t' )              value = KEY_TAB;
      else if( value == '\b' )              value = KEY_BACKSPACE;
      break;
      
    case 0x02:
      // Convert value to Upper case
      value = toupper(value);
      // ASCII => 'A' = 0x41 (65)
      // Scan code for 'a' is KEY_A (0x04) + modifier if uppercase (See hut.h)
      value = value - 'A' + KEY_A;
      break;

    case 0x03:
      if ( value == '0' ) 
        value = KEY_KP0;
      else
        value = value - '1' + KEY_KP1;
      break;

    case 0x04:
      if ( value == '-' || value == '_') {
        if( value == '_') modifier = KEY_MOD_LSHIFT;
        value = KEY_MINUS;
      }
      
      else if ( value == '+' || value == '=' ) {
        if( value == '=' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_EQUAL;
      }

      else if ( value == '{' || value == '[' ) {
        if ( value == '{' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_LEFTBRACE;
      }

      else if ( value == '}' || value == ']' ) {
        if ( value == '}' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_RIGHTBRACE;
      }

      else if ( value == '\\' || value == '|' ) {
        if( value == '|' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_BACKSLASH;
      }

      else if ( value == '\t' ) {
        value = KEY_TAB;
      }

      else if( value == ':' || value == ';' ) {
        if ( value == ':' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_SEMICOLON;
      }

      else if( value == '\'' || value == '"' ) {
        if ( value == '"' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_APOSTROPHE;
      }

      else if( value == '`' || value == '~' ) {
        if ( value == '~' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_GRAVE;
      }

      else if( value == ',' || value == '<' ) {
        if ( value == '<' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_COMMA;
      }

      else if( value == '.' || value == '>' ) {
        if ( value == '>' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_DOT;
      }

      else if( value == '/' || value == '?' ) {
        if ( value == '?' ) modifier = KEY_MOD_LSHIFT;
        value = KEY_SLASH;
      }

      else if ( value == '!' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_1;
      }

      else if( value == '@' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_2;
      }

      else if( value == '#' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_3;
      }

      else if( value == '$' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_4;
      }

      else if( value == '%' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_5;
      }
      else if( value == '^' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_6;
      }

      else if( value == '&' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_7;
      }

      else if( value == '*' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_8;
      }

      else if( value == '(' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_9;
      }

      else if( value == ')' ) {
        modifier = KEY_MOD_LSHIFT;
        value = KEY_0;
      }

      else if( value == ' ' ) {
        value = KEY_SPACE;
      }
      break;
    
    default:
      break;
  }


  // Update these values in Write Buffer
  writebuff[0] = modifier;  // Modifier
  writebuff[1] = 0x00;      // Reserved
  writebuff[2] = value;
  writebuff[3] = 0x00;
  writebuff[4] = 0x00;
  writebuff[5] = 0x00;
  writebuff[6] = 0x00;
  writebuff[7] = 0x00;
  while( !HID_Write(writebuff,8) );
  Delay_ms(30);


  writebuff[0] = 0x00;  // Modifier
  writebuff[2] = 0x00;
  while( !HID_Write(writebuff,8) );
  Delay_ms(30);
}

//////////////////////////////////////////////////////////////////////////////////////////