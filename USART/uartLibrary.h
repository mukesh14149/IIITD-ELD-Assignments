 /**
 * This library contains the interaction with the UART interface.
 * 
 * Usage:
 * 	1) In your program include "uartLibrary.h"
 * 	2) In your main function, redefine stdout and stdin:
 * 	   		stdout = &uart_output;
 * 	   		stdin  = &uart_input;
 * 	3) If you successfully implemented the functions below,
 * 	   you will be able to use
 * 	   		puts(string s);
 * 	   		printf(string, parameters);
 * 	   to print data into the UART interface. With
 * 	   		char c = getChar();
 *     you can read from the terminal.
 *
 * For further information have a look at the example code that is
 * included.
 */


#ifndef UART_LIBRARY_INCLUDED
#define UART_LIBRARY_INCLUDED
#define FOSC 16000000UL 
#define BAUD 9600
#define ubrr (FOSC/8/BAUD-1)


#include <util/setbaud.h>
#include <avr/io.h>
#include <stdio.h>

/**
 * Configures the UART port
 * Put all parameters that need to be set regarding the UART here.
 */
void uart_init() {
	
	
	UBRR0H = (unsigned char)(ubrr>>8);
	UBRR0L = (unsigned char)ubrr;
	UCSR0A = (1 << U2X0);
	UCSR0B = (1 << RXEN0) | (1 << TXEN0)|(1 << RXCIE0);
	UCSR0C = (1 << USBS0) | (1 << UCSZ00) | (1 << UCSZ01);
	
}

/**
 * Prints a character to the UART interface
 * @params c: the character to be printed
 * @params *stream: The file stream. Do not worry what
 * 		    is put there. It is used internally by puts
 * 		    or printf.
 */
void uart_putchar(char c, FILE *stream) {
	if (c == '\n') {		// format the string nicely for display on the serial terminal
		uart_putchar('\r', stream);
	}
	
	while ( !( UCSR0A & (1<<UDRE0)) );
	UDR0=c;

}


/**
 * Get a character from the UART interface
 * @params *stream: The file stream. Do not worry what
 * 		    is put there. It is used internally by puts
 * 		    or printf.
 */
char uart_getchar(FILE *stream) {
	
	while(!(UCSR0A &(1<<RXC0)));
	return UDR0;	
}



/**
 * Allows you to use printf, puts as commands to print something through the UART
 * on your serial console. It then can be displayed using HyperTerminal, minicom etc.
 */
FILE uart_output = FDEV_SETUP_STREAM(uart_putchar, NULL, _FDEV_SETUP_WRITE);

/**
 * Allows you to use getChar() to get a character from the user through UART
 */
FILE uart_input = FDEV_SETUP_STREAM(NULL, uart_getchar, _FDEV_SETUP_READ);


#endif
