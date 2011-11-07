namespace RTE;

import e.types;
import RTE.ProtocolHandler;
import RTE.Communicator;
import RTE.SecondProvider;

init(){
	RTE.SecondProvider.init();
	RTE.Communicator.init();
	RTE.ProtocolHandler.init();
}

run(){
	RTE.Communicator.refresh();
	RTE.SecondProvider.refresh();
}

Communicator_dataReceived(uint8 rcv){
	RTE.ProtocolHandler.dataReceived(rcv);
}