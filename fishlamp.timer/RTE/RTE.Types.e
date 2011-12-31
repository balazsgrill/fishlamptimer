namespace RTE.Types;

import e.types;
import e.platform;

type Time = struct{
	uint8 sec,
	uint8 min, 
	uint8 hour
}

Time_increment(var Time time){
	time.sec = time.sec + 1;
	if (time.sec == 60){
		time.sec = 0;
		time.min = time.min + 1;
		if (time.min == 60){
			time.min = 0;
			time.hour = time.hour+1;
			if (time.hour == 24){
				time.hour = 0;
			}
		}
	}
}

Time_copy(var Time to, var Time from){
	to.sec = from.sec;
	to.min = from.min;
	to.hour = from.hour;
}

Time_compare(Time t1, Time t2){
	result = 0;
	if (t1.hour == t2.hour){
		if (t1.min == t2.min){
			if (t1.sec == t2.sec){
				result = 1;
			}
		}
	}
}returns bool result;

operator EQUALS{
	Time_compare
}
