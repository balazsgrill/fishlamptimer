namespace RTE;

import e.types;
import RTE.ProtocolHandler;
import RTE.Communicator;
import RTE.SecondProvider;
import RTE.Clock;
import RTE.Types; 
import dio;
import spi;

init(){
	RTE.Clock::init();
	RTE.SecondProvider::init();
	RTE.Communicator::init();
	RTE.ProtocolHandler::init();
}

run(){
	RTE.Communicator::refresh();
	RTE.SecondProvider::refresh();
}

Communicator_dataReceived(uint8 rcv){
	RTE.ProtocolHandler::dataReceived(rcv);
}

SecondProvider_secondElapsed(){
	RTE.Clock::secondElapsed();
}

Clock_timeChanged(Time time){
	RTE.Communicator::timeChanged(time);
}

debug(uint8 d){
	SPI_Send(RC0, RC1, d);
}
