# lappsgrid/vassar
#
# This image extends the tomcat7 image and adds the Lapps services running
# on the Vassar node.

FROM lappsgrid/tomcat7

ENV TERM=xterm

USER root
ADD ./packages/lappsgrid-gate.tgz /usr/share/gate
ADD ./packages/lappsgrid-models.tgz /usr/share/lapps
ADD ./packages/MASC-3.0.0.tgz /var/corpora/MASC-3.0.0
ADD ./packages/lappsgrid-services.tgz /var/lib/tomcat7/webapps

ADD ./startup.sh /usr/bin/startup
ADD ./shutdown.sh /usr/bin/shutdown
ADD ./tail-log.sh /usr/bin/taillog
ADD ./waitforlog.sh /usr/bin/waitforlog
ADD ./waitforstart.sh /usr/bin/waitforstart

RUN 	chmod ug+x /usr/bin/waitforstart 

RUN chmod ug+x /usr/bin/taillog && \
	chmod ug+x /usr/bin/shutdown && \
	chmod ug+x /usr/bin/waitforlog &&  \
	chown -R tomcat7:tomcat7 /usr/share/gate && \
	chown -R tomcat7:tomcat7 /usr/share/lapps
	
CMD ["/usr/bin/startup"]
