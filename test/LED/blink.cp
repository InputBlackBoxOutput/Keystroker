#line 1 "C:/Users/admin/Desktop/Github/Keystroker/test/LED/blink.c"






void main() {
 TRISA = 0;

 while(1){
 LATA |= 1 <<  0  || 1 <<  1  || 1 <<  2 ;
 Delay_ms(1000);
 LATA &=~(1 <<  0  || 1 <<  1  || 1 <<  2 );
 Delay_ms(1000);

 };
}
