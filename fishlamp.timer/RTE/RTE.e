namespace RTE;

import RTE.ProtocolHandler;
import RTE.SecondProvider;

init(){
	RTE.ProtocolHandler.init();
	RTE.SecondProvider.init();
}

run(){
	RTE.ProtocolHandler.refresh();
	RTE.SecondProvider.refresh();
}
