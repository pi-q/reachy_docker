build:
	docker build -t mariemcharbonneau/reachy_docker:latest ${CURDIR}

push:
	@echo "publish to latest $<"
	docker push mariemcharbonneau/reachy_docker:latest

pull:
	docker pull mariemcharbonneau/reachy_docker:latest


#Notes:
#alternative command to build docker from dockerfile
#docker build --no-cache -f Dockerfile -t mariemcharbonneau/reachy_docker:latest .
