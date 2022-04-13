build:
	docker build -t mariemcharbonneau/reachy_docker:latest ${CURDIR}

push:
	@echo "publish to latest $<"
	docker push mariemcharbonneau/reachy_docker:latest

pull:
	docker pull mariemcharbonneau/reachy_docker:latest