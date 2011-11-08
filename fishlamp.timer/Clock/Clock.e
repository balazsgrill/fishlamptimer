namespace Clock;

import e.types;
import RTE.Clock;
import RTE.Types;

Time currentTime;

secondElapsed(){
	Time_increment(currentTime);
	RTE.Clock::timeChanged(currentTime);
}
