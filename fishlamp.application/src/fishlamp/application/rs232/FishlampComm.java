/**
 * 
 */
package fishlamp.application.rs232;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.TooManyListenersException;

import fishlamp.application.protocol.IFrame;
import fishlamp.application.protocol.IFrameListener;
import fishlamp.application.protocol.IFrameParser;
import fishlamp.application.protocol.IFrameParserFactory;
import fishlamp.application.protocol.InputStreamParser;
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

/**
 * @author balage
 *
 */
public class FishlampComm implements IFrameParserFactory{

	private OutputStream out;

	public FishlampComm(String port) throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException, IOException, TooManyListenersException {
		 CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(port);
		 CommPort commPort = portIdentifier.open(this.getClass().getName(),2000);
         
         if ( commPort instanceof SerialPort )
         {
             SerialPort serialPort = (SerialPort) commPort;
             serialPort.setSerialPortParams(
            		 9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
             
             final InputStream in = serialPort.getInputStream();
             out = serialPort.getOutputStream();
                            
             InputStreamParser parser = new InputStreamParser(this, in);
             parser.addListener(new IFrameListener() {
				
				@Override
				public void frameArrived(Object frame) {
						System.out.println("Frame: "+frame);
				}
			});
             Thread t = new Thread(parser);
             t.setDaemon(true);
             t.start();

         }
         else
         {
             
         }
	}

	public synchronized void sendFrame(IFrame frame) throws IOException{
		short[] data = frame.toBytes();
		for(short d : data){
			out.write(d);
		}
	}
	
	@Override
	public IFrameParser<?> startParsing(short firstbyte) {
		switch(firstbyte){
		case 0xFF: return new TimeFrameParser(); 
		}
		return null;
	}
	
}
