#!/bin/bash
LOG=/var/log/tomcat7/catalina.out

until [ -e $LOG ] ; do
	sleep 2
done

started=`cat $LOG | grep "INFO: Server startup in"`
while [ -z "$started" ] ; do
	echo "Waiting for Tomcat to finish startup."
	sleep 5
	started=`cat $LOG | grep "INFO: Server startup in"`
done
echo $started
