namespace Communicator;

import e.types;
import e.platform;
import pic18f14k50.eusart;
import RTE.Communicator;
import RTE.Types;
import RTE;

uint8 sendState;
Time currentTime; 

init(){
	RS232_init();
	sendState = 0;
	currentTime.sec = 0;
	currentTime.min = 0;
	currentTime.hour = 0;
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

timeChanged(Time time){
	RTE::debug(time.sec);
	if (sendState == 0){
		//Time_copy(currentTime, time);
		currentTime.sec = time.sec;
		currentTime.min = time.min;
		currentTime.hour = time.hour;
		sendState = 4;
	}
}