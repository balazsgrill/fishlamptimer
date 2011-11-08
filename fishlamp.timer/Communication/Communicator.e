namespace Communicator;

import e.types;
import e.platform;
import pic18f14k50.eusart;
import RTE.Communicator;
import RTE.Types;

init(){
	RS232_init();
	sendState = 0;
}

refresh(){
	uint8 rcv;
	uint8 rcvcounter;
	
	rcvcounter = 0;
	RS232_rcv(rcv, rcvcounter);
	if (rcvcounter){
		// data is received
		RTE.Communicator::dataReceived(rcv);
	}
}

uint8 sendState;
Time currentTime; 

timeChanged(Time time){
	if (sendState == 0){
		Time_copy(currentTime, time);
	}
}