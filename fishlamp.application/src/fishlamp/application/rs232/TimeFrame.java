/**
 * 
 */
package fishlamp.application.rs232;

import fishlamp.application.protocol.IFrame;

/**
 * @author balazs.grill
 *
 */
public class TimeFrame implements IFrame {

	public int hour = 0;
	public int min = 0;
	public int sec = 0;
	
	@Override
	public String toString() {
		return "Time "+hour+":"+min+":"+sec;
	}

	@Override
	public short[] toBytes() {
		return new short[]{0xFF, (short)hour, (short)min, (short)sec};
	}
	
}
