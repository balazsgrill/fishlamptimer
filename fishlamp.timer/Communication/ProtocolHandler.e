namespace ProtocolHandler;

import e.types;
import e.platform;
import e.platform.u8;
import TimeFrameParser;

init(){
	pendingmessage = 0;
}

/**
 * Currently received message
 */
uint8 pendingmessage;

parsingDone(){
	pendingmessage = 0;
}

/*
 * Receive a byte
 */
dataReceived(uint8 rcv){

	if(pendingmessage == 0){
		//no current message
		pendingmessage = rcv;
		TimeFrameParser::init();
	}else{
		if (pendingmessage == 0xFF){
			TimeFrameParser::parse(rcv);
		}
	}
}