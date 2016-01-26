/*
  Name:Mukesh Gupta(2014149)
  
*/  
#include<stdint.h>                    //Variable for choosing value of mux
#include <avr/io.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/interrupt.h>
uint8_t a; 

void  adc_init(){
	PRR=(0<<PRADC);	//power reduction registor set to 0  to minimise power using
	ADMUX = (1<<REFS0);  //voltage refrence selection
	ADCSRA = (1<<ADEN)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);     //enable adc and doing 	Prescaling to 128 bit	

}
void adc_read(void){
    ADMUX |= a;               	        //set channel 0;
    ADCSRA |= (1<<ADSC);      		//set to start adc conversion
    while(ADCSRA & (1<<ADSC));    	//go till conversion is going on
    if(ADC<40)                      	//check the value of adc     
    {
	PORTD = (1<<PD5);          	//glow led base on condition
    }
    else
        PORTD= 0x00;
   
}
void adc_read1(void){
    	ADMUX |= a;                  	//set channel 1;
    	ADCSRA |= (1<<ADSC);          	//set to start adc conversion
    	while(ADCSRA & (1<<ADSC));    	//go till conversion is going on
    	if(ADC>250)                  	//check the value of adc 
    	{
		PORTD = (1<<PD6);       //glow led base on condition
    	}
    	else
        	PORTD = 0x00;
}
ISR(TIMER1_OVF_vect)
{
  

}
void enterSleep(void)
{
  SMCR=(0<<SM2)|(0<<SM1)|(0<<SM0);       //set to idle mode
  sleep_enable();			 // enable sleep mode 
  power_spi_disable();		        //disabled all peripherals which is not used
  power_timer0_disable();
  power_timer2_disable();
  power_twi_disable();  
  sleep_mode();				//enter sleep mode
  sleep_disable(); 			//program continue where it stop
  power_all_enable();			//re-enable the peripherals
}
int main(void)
{
	cli();  
  	TCCR1A = 0x00;
	TCNT1=0x0000;
	TCCR1B = 0x04;
	TIMSK1=0x01;
	sei();
     	int c=0;                	//used to toggle the channel
     	DDRD = (1<<DDD6)|(1<<DDD5);           
     	adc_init();      
     	while(1) 
     	{
       		if(c==0){               //it works for channel 0
        		adc_read();
        		a&=0b00000000;
        		c=1;
      		}
       		else{                   //it works for channel 1
          		adc_read1();
          		a&=0b00000001;
          		c=0;
       	 	} 
		_delay_ms(500);
		//enterSleep();
    	}
}

