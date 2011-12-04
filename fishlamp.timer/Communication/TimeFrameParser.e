namespace TimeFrameParser;

import e.types;
import e.platform;
import ProtocolHandler;
import RTE.Types;
import RTE.ProtocolHandler;

uint8 state;

Time time;


init(){
	state = 0;
}

parse(uint8 byte){
	if (state == 0){
		time.hour = byte;
	}
	if (state == 1){
		time.min = byte;
	}
	if (state == 2){
		time.sec = byte;
		ProtocolHandler::parsingDone();
		RTE.ProtocolHandler::timeReceived(time);
	}
	state = state+1;
}


