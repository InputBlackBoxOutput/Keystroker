#line 1 "C:/Users/admin/Desktop/Github/Keystroker/test/Button/sequencer.c"









void main() {
 int oldState;
 TRISB |= 1 <<  RA4 ;
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

 LATA &=~ (1 <<  0  || 1 <<  1  || 1 <<  2  );


 LATA |= 1 <<  2 ;
 Delay_ms( 500 );

 LATA |= 1 <<  1 ;
 Delay_ms( 500 );

 LATA |= 1 <<  0 ;
 Delay_ms( 500 );
 }
 else {

 LATA &=~ (1 <<  0  || 1 <<  1  || 1 <<  2  );


 LATA |= 1 <<  0 ;
 Delay_ms( 500 );

 LATA |= 1 <<  1 ;
 Delay_ms( 500 );

 LATA |= 1 <<  2 ;
 Delay_ms( 500 );
 }
 }
}
