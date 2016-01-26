CC=avr-gcc
MCU=atmega328p
PORT=/dev/ttyUSB0
PROGRAMMER=arduino
BAUDRATE=57600
DF_CPU=16000000L

CFLAGS=-Os -Wall -mmcu=$(MCU) -DF_CPU=$(DF_CPU)
OBJCOPY=avr-objcopy
BIN_FORMAT=ihex

AVRDUDE=avrdude -F -V -D

second: blink.hex
blink.hex: blink.elf
blink.elf: blink.s
blink.s: blink.c

%.s: %.c
	$(CC) $(CFLAGS) -S -o $@ $<
%.elf: %.s  
	$(CC) $(CFLAGS) -s -o $@ $<
%.hex: %.elf 
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom $< $@

upload: blink.hex
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUDRATE) -U flash:w:$<

clean:
	rm -f blink.s blink.elf blink.hex




