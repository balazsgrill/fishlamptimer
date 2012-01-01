/**
 * 
 */
package fishlamp.application;

import org.eclipse.swt.widgets.Label;

import fishlamp.application.protocol.IFrameListener;
import fishlamp.application.rs232.TimeFrame;

/**
 * @author balage
 *
 */
public class CalibrationThread extends Thread implements IFrameListener{

	private final Label label;
	
	private final long TIME = 2l*60l*60l*1000l;
	
	public CalibrationThread(Label label) {
		this.label = label;
	}
	
	private volatile boolean done = false;
	
	private volatile TimeFrame tf = null; 
	
	@Override
	public synchronized void frameArrived(Object frame) {
		if (!done){
			if (frame instanceof TimeFrame){
				this.tf = (TimeFrame)frame;
			}
		}
	}
	
	@Override
	public void run() {
		long start = System.currentTimeMillis();
		done = false;
		while(!done){
			try {
				sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			long now = System.currentTimeMillis();
			final long time = now-start;

			synchronized (this) {
				if (time >= TIME){
					//Done
					done = true;
				}
				final TimeFrame tf = this.tf;
				label.getDisplay().asyncExec(new Runnable() {

					@Override
					public void run() {
						String t = "?";
						if (tf != null){
							t = ""+(tf.sec+60*(tf.min+(60*tf.hour)));
						}
						long p = (time*100/TIME);
						label.setText("Calib: "+(time/1000)+" / "+t+" ("+p+"%)");
					}
				});

			}
		}
	}
	
}
