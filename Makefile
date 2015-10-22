vassar:
	/usr/local/bin/docker build -t lappsgrid/vassar .

tiny:
	/usr/local/bin/docker build -f Dockerfile.tiny -t lappsgrid/vassar:tiny .
	
push:
	/usr/local/bin/docker push lappsgrid/vassar
	
push-tiny:
	/usr/local/bin/docker push lappsgrid/vassar:tiny
	
help:
	@echo
	@echo "GOALS"
	@echo "vassar    - builds the Vassar tomcat server"
	@echo "tiny      - builds a smaller image."
	@echo "push      - uploads the image to hub.docker.com"
	@echo "push-tiny - uploads the tiny image to hub.docker.com"
	@echo
