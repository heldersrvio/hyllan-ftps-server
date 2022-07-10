VERSION ?= 0.0.1
CONTAINER_NAME ?= hyllan-ftps-server

.PHONY: build
build:
	docker build -t hyllan-ftps-server:${VERSION} .

.PHONY: run
run:
	docker run --name ${CONTAINER_NAME} -e USER=${USER} -e PASSWORD=${PASSWORD} -p 20-21:20-21 -p 21100-21110:21100-21110 hyllan-ftps-server:${VERSION}

.PHONY: clean
clean:
	docker stop ${CONTAINER_NAME} && docker container rm ${CONTAINER_NAME}

