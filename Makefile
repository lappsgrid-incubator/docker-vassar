vassar:
	/usr/local/bin/docker build -t lappsgrid/vassar .

push:
	/usr/local/bin/docker push lappsgrid/vassar
	
help:
	@echo
	@echo "GOALS"
	@echo "vassar - builds the Vassar tomcat server"
	@echo "push   - uploads the image to hub.docker.com"
	@echo
