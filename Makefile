DOCKER=/usr/bin/docker
IMAGE=lappsgrid/vassar

vassar:
	./packages.sh update
	$(DOCKER) build -t $(IMAGE) .

tiny:
	./packages.sh update
	$(DOCKER)  build -f Dockerfile.tiny -t $(IMAGE):tiny .
	
push:
	$(DOCKER)  push $(IMAGE)
	
push-tiny:
	$(DOCKER)  push $(IMAGE):tiny
	
tag:
	if [ -n "$(TAG)" ] ; then $(DOCKER) tag $(IMAGE) $(IMAGE):$(TAG) ; $(DOCKER) push $(IMAGE):$(TAG) ; fi

help:
	@echo
	@echo "GOALS"
	@echo "vassar    - builds the Vassar tomcat server"
	@echo "tiny      - builds a smaller image."
	@echo "push      - uploads the image to hub.docker.com"
	@echo "push-tiny - uploads the tiny image to hub.docker.com"
	@echo "tag       - Tags the image on hub.docker.com"
	@echo
