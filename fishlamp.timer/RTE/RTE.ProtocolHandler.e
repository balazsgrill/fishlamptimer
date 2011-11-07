namespace RTE.ProtocolHandler;

import e.types;
import e.platform;
import ProtocolHandler;

init(){
	ProtocolHandler.init();
}

dataReceived(uint8 rcv){
	ProtocolHandler.dataReceived(rcv);
}