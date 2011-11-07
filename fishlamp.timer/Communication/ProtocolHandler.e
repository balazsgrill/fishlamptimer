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

	if(pendingmessage == 0){
		//no current message
		pendingmessage = rcv;
	}
}