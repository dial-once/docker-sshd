IMAGE = dialonce/sshd
VERSION ?= latest

build:
	docker build -t $(IMAGE) .

debug:
	docker run -it $(IMAGE) sh

run:
	docker run -it $(IMAGE)

push:
	docker login -e $(DOCKER_EMAIL) -u $(DOCKER_USER) -p $(DOCKER_PASS)
	docker push $(IMAGE):$(VERSION)

.PHONY: build
