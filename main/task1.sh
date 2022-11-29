#!/bin/bash
Btask1(){
	dir=Reports
	ddate=`/bin/date +%d`
	mdate=`/bin/date +%m`
	ydate=`/bin/date +%Y`
	
	if [[ -f  ~/$dir/$ydate/$mdate/$ddate.xls ]];
	then
	    echo " Today's report exists.";
	elif [[ -d ~/$dir/$ydate/$mdate ]];
	then
	    touch ~/$dir/$ydate/$mdate/$ddate.xls;
	
	else
	    mkdir -p ~/$dir/$ydate/$mdate;
	    touch ~/$dir/$ydate/$mdate/$ddate.xls
	fi


}

