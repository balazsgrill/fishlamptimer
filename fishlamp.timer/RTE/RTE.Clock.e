namespace RTE.Clock;

import Clock;
import RTE.Types;
import RTE;

init(){
	Clock::init();
}

secondElapsed(){
	Clock::secondElapsed();
}

timeReceived(Time time){
	Clock::timeReceived(time);
}

timeChanged(Time time){
	RTE::Clock_timeChanged(time);
}