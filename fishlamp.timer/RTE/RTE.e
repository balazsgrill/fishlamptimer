namespace RTE;

import e.types;
import RTE.ProtocolHandler;
import RTE.Communicator;
import RTE.SecondProvider;
import RTE.Clock;
import RTE.Types; 
import RTE.Switch;
import dio;
import spi;

init(){
	RTE.Clock::init();
	RTE.SecondProvider::init();
	RTE.Communicator::init();
	RTE.ProtocolHandler::init();
	RTE.Switch::init();
}

run(){
	RTE.Communicator::refresh();
	RTE.SecondProvider::refresh();
}

Communicator_dataReceived(uint8 rcv){
	RTE.ProtocolHandler::dataReceived(rcv);
}

ProtocolHandler_timeReceived(Time time){
	RTE.Clock::timeReceived(time);
}

SecondProvider_secondElapsed(){
	RTE.Switch::secondElapsed();
	RTE.Clock::secondElapsed();
}

Clock_timeChanged(Time time){
	RTE.Communicator::timeChanged(time);
	RTE.Switch::timeChanged(time);
}

debug(uint8 d){
	//SPI_Send(RC0, RC1, d);
}
