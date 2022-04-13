# reachy_docker
A repository dedicated to the files used to generate a docker image for working with the Reachy robot.

The image is hosted on Docker Hub (https://hub.docker.com/repository/docker/mariemcharbonneau/reachy_docker). 

Usage: 
- Pull the image from Docker Hub:
`` cd <location where this repository was pulled>/reachy_docker``
`` make pull``

- Build the image:
``make build``

- Start a container:
``cd .. && ./docker/docker_start.sh``
