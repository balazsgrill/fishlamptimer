namespace RTE.SecondProvider;

import e.platform;
import e.types;
import SecondProvider;
import RTE;

init(){
	SecondProvider::init();
}

refresh(){
	SecondProvider::refresh();
}

secondElapsed(){
	RTE::SecondProvider_secondElapsed();
}