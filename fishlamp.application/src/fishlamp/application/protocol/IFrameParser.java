/**
 * 
 */
package fishlamp.application.protocol;

/**
 * @author balazs.grill
 *
 */
public interface IFrameParser<T> {

	/**
	 * @param d
	 * @return
	 */
	public void newByte(short d);
	
	/**
	 * Frame parsing is done
	 * @return
	 */
	public boolean done();
	
	/**
	 * Return the parsed frame
	 * @return
	 */
	public T getFrame();
	
}
