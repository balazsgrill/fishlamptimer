namespace SecondProvider;

import e.types;
import e.platform;
import microchip.PIC18F14K50;
import microchip.pic18.assisted;
import microchip.pic18;
import RTE.SecondProvider;

/**
 * Internal clock is 4MHz, CPUDIV is 4 => CLK is 1MHz
 * One sec is 1.000.000 CPU ticks
 * One timer tick is 64 CPU ticks
 * => one sec is 15625 timer ticks 
 */
const uint8 ONE_SECOND = 15625;

/**
 * Timer is set to 0xFFFF-ONE_SECOND to cause the timer
 * to overflow in every second
 */
const uint8 TIMERVALUE = 0xFFFF-ONE_SECOND;

init(){
	//Timer 0 control: 
	//enable timer, input is internal clock
	//prescaler is 64x
	//binary 10000101
	T0CON = 0x85;
	
	//Clear INTCON:TMR0IF
	aBCF(addr(INTCON),2);
	//Clear INTCON:TMR0IE
	aBCF(addr(INTCON),5);
}

refresh(){
	//Skip goto if INTCON:TMR0IF
	aBTFSS(addr(INTCON),2);
	GOTO(@end);
	
	//Clear INTCON:TMR0IF
	aBCF(addr(INTCON),2);
	//Restart timer
	TMR0H = TIMERVALUE/256;
	TMR0L = TIMERVALUE%256;
	
	//notify clients about elapsed second
	secondElapsed();
	
	label end;
}