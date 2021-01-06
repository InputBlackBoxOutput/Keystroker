// LED blink test

void main() {
  TRISA = 0x07;

  while(1){
    // Turn the LEDs on
    LATA |= 0x07;
    Delay_ms(1000);
    
    // Turn the LEDs off
    LATA &=~ 0x07;
    Delay_ms(1000);
  };
}