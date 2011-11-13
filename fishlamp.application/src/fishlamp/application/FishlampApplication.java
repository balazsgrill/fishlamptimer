/**
 * 
 */
package fishlamp.application;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

/**
 * @author balage
 *
 */
public class FishlampApplication implements IApplication {

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplication#start(org.eclipse.equinox.app.IApplicationContext)
	 */
	@Override
	public Object start(IApplicationContext context) throws Exception {
		final Display display = new Display();
		// Shell must be created with style SWT.NO_TRIM
		final Shell shell = new Shell(display, SWT.SHELL_TRIM);
		
		shell.setLayout(new GridLayout(2, false));
		
		Label l = new Label(shell, SWT.NONE);
		l.setText("Device: ");
		Text dev = new Text(shell, SWT.BORDER);
		dev.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false));
		
		
		shell.pack();
		shell.open();
	    while (!shell.isDisposed()) {
	      if (!display.readAndDispatch())
	        display.sleep();
	    }
	    display.dispose();
		
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplication#stop()
	 */
	@Override
	public void stop() {
		// TODO Auto-generated method stub

	}

}