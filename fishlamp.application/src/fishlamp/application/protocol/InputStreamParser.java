/**
 * 
 */
package fishlamp.application.protocol;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;

/**
 * @author balazs.grill
 *
 */
public class InputStreamParser implements Runnable{

	private final Set<IFrameListener> listeners = new HashSet<IFrameListener>();
	
	public boolean addListener(IFrameListener e) {
		synchronized (listeners) {
			return listeners.add(e);
		}
	}

	public boolean removeListener(IFrameListener o) {
		synchronized (listeners) {
			return listeners.remove(o);
		}
	}

	private final IFrameParserFactory factory;
	private final InputStream is;
	
	public InputStreamParser(IFrameParserFactory factory, InputStream is) {
		this.factory = factory;
		this.is = is; 
	}
	
	private IFrameParser<?> fparser = null;
	
	private void newByte(short d){
		if (fparser == null){
			fparser = factory.startParsing(d);
		}else{
			fparser.newByte(d);
			if (fparser.done()){
				Object frame = fparser.getFrame();
				synchronized (listeners) {
					for(IFrameListener l : listeners){
						l.frameArrived(frame);
					}
				}
				fparser = null;
			}
		}
	}

	@Override
	public void run() {
		try{
			int d = -1;
			while((d=is.read())!=-1){
				newByte((short)d);
			}
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
}
