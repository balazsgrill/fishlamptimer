/**
 * 
 */
package fishlamp.application.rs232;

/**
 * @author balazs.grill
 *
 */
public class TimeFrame {

	public int hour = 0;
	public int min = 0;
	public int sec = 0;
	
	@Override
	public String toString() {
		return "Time "+hour+":"+min+":"+sec;
	}
	
}
