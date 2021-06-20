#!/bin/bash

mkdir logs

for installerfile in ./scripts/*
do
    if [[ -f "/etc/profile.d/rvm.sh" ]]
    then
	source /etc/profile.d/rvm.sh
    fi
    
    echo "`date +'%H:%M'` $installerfile"
    INSFN=`basename $installerfile`
    bash "$installerfile" -H #> "./logs/$INSFN.out.log" 2> "./logs/$INSFN.err.log"
done

echo -ne "\007"

