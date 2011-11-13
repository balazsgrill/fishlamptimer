/**
 * 
 */
package fishlamp.application.rs232;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.TooManyListenersException;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;

/**
 * @author balage
 *
 */
public class FishlampComm {

	public FishlampComm(String port) throws NoSuchPortException, PortInUseException, UnsupportedCommOperationException, IOException, TooManyListenersException {
		 CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(port);
		 CommPort commPort = portIdentifier.open(this.getClass().getName(),2000);
         
         if ( commPort instanceof SerialPort )
         {
             SerialPort serialPort = (SerialPort) commPort;
             serialPort.setSerialPortParams(57600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
             
             final InputStream in = serialPort.getInputStream();
             OutputStream out = serialPort.getOutputStream();
                            
             //(new Thread(new SerialWriter(out))).start();
             
             serialPort.addEventListener(new SerialPortEventListener() {
				
				@Override
				public void serialEvent(SerialPortEvent arg0) {
					int data;
			          
		            try
		            {
		                int len = 0;
		                while ( ( data = in.read()) > -1 )
		                {
//		                    if ( data == '\n' ) {
//		                        break;
//		                    }
		                    //buffer[len++] = (byte) data;
		                }
		                //System.out.print(new String(buffer,0,len));
		            }
		            catch ( IOException e )
		            {
		                e.printStackTrace();
		                System.exit(-1);
		            } 
					
				}
			});
             serialPort.notifyOnDataAvailable(true);

         }
         else
         {
             
         }
	}
	
}
