/**
 * 
 */
package fishlamp.application.protocol;

/**
 * @author balazs.grill
 *
 */
public interface IFrameParserFactory {

	public IFrameParser<?> startParsing(short firstbyte);
	
}
