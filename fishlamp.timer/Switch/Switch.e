namespace Switch;

import e.types;
import e.platform;
import microchip.pic18;
import dio;
import RTE.Types;

const ChannelID PIN_SET = RC1;

const ChannelID PIN_RESET = RC0;

//Turn on
const Time onTime = RTE.Types::Time{0,0,9};

//Turn off
const Time offTime = RTE.Types::Time{0,0,19};

init(){
	DIO_Set(PIN_SET,0);
	DIO_Set(PIN_RESET,0);
}

timeChanged(Time currentTime){
	DIO_Set(PIN_SET,0);
	DIO_Set(PIN_RESET,0);
	if (onTime == currentTime){
		DIO_Set(PIN_SET,1);
	}
	if (offTime == currentTime){
		DIO_Set(PIN_RESET,1);
	}
}

secondElapsed(){
	//DIO_Set(PIN_SET,0);
	//DIO_Set(PIN_RESET,0);
}


