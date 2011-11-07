namespace RTE.Communicator;

import e.types;
import Communicator;
import RTE;

init(){
	Communicator.init();
}

refresh(){
	Communicator.refresh();
}

dataReceived(uint8 d){
	RTE.Communicator_dataReceived(d);
}