#!/bin/bash
LOG=/var/log/tomcat7/catalina.out

until [ -e $LOG ] ; do
	sleep 2
done
