// LED sequencer

#define LED_R 0
#define LED_Y 1
#define LED_G 2
#define ON_DELAY  500 //ms

#define BTN RA4

void main() {
  int oldState;
  TRISB |= 1 << BTN;
  TRISA = 0x07;
  
  LATA = 0x00;

  while(1) {
      if(RA4 == 0) {
        if(oldState == 1)
            oldState = 0;
        else
            oldState = 1;
      }
      if(oldState == 1) {
         // Turn off all LEDS
         LATA &=~ (1 << LED_R || 1 << LED_Y || 1 << LED_G );
         
         // Turn on one by one
         LATA |= 1 << LED_G;
         Delay_ms(ON_DELAY);

         LATA |= 1 << LED_Y;
         Delay_ms(ON_DELAY);
         
         LATA |= 1 << LED_R;
         Delay_ms(ON_DELAY);
      }
      else {
         // Turn off all LEDS
         LATA &=~ (1 << LED_R || 1 << LED_Y || 1 << LED_G );
         
         // Turn on one by one
         LATA |= 1 << LED_R;
         Delay_ms(ON_DELAY);
         
         LATA |= 1 << LED_Y;
         Delay_ms(ON_DELAY);
         
         LATA |= 1 << LED_G;
         Delay_ms(ON_DELAY);
      }
  }
}