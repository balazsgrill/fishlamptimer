namespace Communicator;

import e.types;
import e.platform;
import pic18f14k50.eusart;
import RTE.Communicator;

init(){
	RS232_init();
}

refresh(){
	uint8 rcv;
	uint8 rcvcounter;
	
	rcvcounter = 0;
	RS232_rcv(rcv, rcvcounter);
	if (rcvcounter){
		// data is received
		RTE.Communicator.dataReceived(rcv);
	}
}