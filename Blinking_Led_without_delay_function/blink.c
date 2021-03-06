/*
  Name:Mukesh Gupta(2014149) 
*/  
void _delay_ms(unsigned long delay) {  
  volatile unsigned long i = 0;
  for (i = 0; i < delay; i++) {
      __asm__ __volatile__ ("nop");          /*Each 'nop' statement executes in one machine cycle (at 16 MHz) yielding a 62.5 ns (nanosecond)
delay. That means this loop takes 62.5xdelay ns */
  }
}

int main (void)
{
  volatile unsigned int *dir = (volatile unsigned int *)0x24; //Accessing DDRB and PORTB 
  volatile unsigned int *port = (volatile unsigned int *)0x25;
  *dir = 0b11111111;    //Set port B to High
  while(1){
    *port = 0b11111111;
    _delay_ms(100000);
    *port = 0b00000000;	//Set port B to Low
    _delay_ms(100000);
  }
  return 1;
}
