namespace Switch;

import e.types;
import e.platform;
import microchip.pic18;
import dio;
import RTE.Types;

const ChannelID PIN_SET = RC0;

const ChannelID PIN_RESET = RC1;

//Turn on
const Time onTime = RTE.Types::Time{0,0,9};

//Turn off
const Time offTime = RTE.Types::Time{0,0,19};

init(){
	DIO_Set(PIN_SET,0);
	DIO_Set(PIN_RESET,0);
}

timeChanged(Time currentTime){
	if (Time_compare(onTime,currentTime)){
		turnOn();
	}
	if (Time_compare(offTime,currentTime)){
		turnOff();
	}
}

deltaSignal(ChannelID ch){
	DIO_Set(ch,1);
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	DIO_Set(ch,0);
}

turnOn(){
	deltaSignal(PIN_SET);
}

turnOff(){
	deltaSignal(PIN_RESET);
}

