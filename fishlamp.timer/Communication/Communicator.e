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
	uint8 counter;
	
	counter = 0;
	RS232_rcv(rcv, counter);
	if (counter){
		// data is received
		RTE.Communicator::dataReceived(rcv);
	}
	
	uint8 send;
	send = 0;
	if (sendState == 0){
		
	}else{
		if (sendState == 4){
			send = 0xFF;
		}
		if (sendState == 3){
			send = currentTime.hour;
		}
		if (sendState == 2){
			send = currentTime.min;
		}
		if (sendState == 1){
			send = currentTime.sec;
		}
		RS232_send(send,counter);
		if (counter){
			sendState = sendState-1;
		}
	}
	
	
}

uint8 sendState;
Time currentTime; 

timeChanged(Time time){
	if (sendState == 0){
		Time_copy(currentTime, time);
		sendState = 4;
	}
}