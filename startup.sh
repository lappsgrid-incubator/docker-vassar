#!/bin/bash
#set -e

LOG=/var/log/tomcat7/catalina.out

#service postgresql start
#until pg_isready &>/dev/null ; do
#	echo -n "."
#	sleep 2
#done

service tomcat7 start
until [ -e $LOG ] ; do
	echo "Waiting for the Tomcat log to appear."
	sleep 2
done

tail -f $LOG

