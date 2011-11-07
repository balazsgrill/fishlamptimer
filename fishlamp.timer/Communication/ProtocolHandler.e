namespace ProtocolHandler;

import e.types;
import e.platform;
import e.platform.u8;

init(){
	pendingmessage = 0;
}

/**
 * Currently received message
 */
uint8 pendingmessage;

/*
 * Receive a byte
 */
dataReceived(uint8 rcv){
	uint8 r;
	isequal_u8(r,pendingmessage, 0);
	if(r){
		//no current message
		pendingmessage = rcv;
	}
}