namespace RTE.Types;

import e.types;
import e.platform;

type Time = struct{
	uint8 sec,
	uint8 min, 
	uint8 hour
}

Time_increment(Time time){
	time.sec = time.sec + 1;
	if (time.sec == 60){
		time.sec = 0;
		time.min = time.min + 1;
		if (time.min == 60){
			time.hour = time.hour+1;
			if (time.hour == 24){
				time.hour = 0;
			}
		}
	}
}