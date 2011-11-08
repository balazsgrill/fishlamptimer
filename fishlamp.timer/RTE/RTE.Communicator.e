namespace RTE.Communicator;

import e.types;
import Communicator;
import RTE;
import RTE.Types;

init(){
	Communicator::init();
}

refresh(){
	Communicator::refresh();
}

timeChanged(Time time){
	Communicator::timeChanged(time);
}

//outport
dataReceived(uint8 d){
	RTE::Communicator_dataReceived(d);
}
