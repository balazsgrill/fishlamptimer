namespace RTE.ProtocolHandler;

import e.types;
import e.platform;
import RTE.Types;
import ProtocolHandler;

init(){
	ProtocolHandler::init();
}

dataReceived(uint8 rcv){
	ProtocolHandler::dataReceived(rcv);
}

timeReceived(Time time){
	RTE::ProtocolHandler_timeReceived(time);
}