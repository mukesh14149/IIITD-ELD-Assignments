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
file=blink

second: $(file).hex
$(file).hex: $(file).elf
$(file).elf: $(file).s
$(file).s: $(file).c

%.s: %.c
	$(CC) $(CFLAGS) -S -o $@ $<
%.elf: %.s  
	$(CC) $(CFLAGS) -s -o $@ $<
%.hex: %.elf 
	$(OBJCOPY) -O $(BIN_FORMAT) -R .eeprom $< $@

upload: $(file).hex
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUDRATE) -U flash:w:$<

clean:
	rm -f $(file).s $(file).elf $(file).hex




