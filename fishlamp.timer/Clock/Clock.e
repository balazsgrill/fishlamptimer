namespace Clock;

import e.types;
import e.platform;
import RTE.Clock;
import RTE.Types;

Time currentTime;

init(){
	currentTime.sec = 0;
	currentTime.min = 0;
	currentTime.hour = 0;
}

secondElapsed(){
	Time_increment(currentTime);
	RTE.Clock::timeChanged(currentTime);
}

timeReceived(Time time){
	Time_copy(currentTime, time);
	//RTE.Clock::timeChanged(currentTime);
}
