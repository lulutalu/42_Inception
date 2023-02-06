# What's Docker

To put it simply, Docker is a way to run processes on your machine (or other host machine)
that are completely isolated from others processes. The said process is a 
runnable instance of an image (just like a VM)

Some of the biggest advantages to use Docker compared to Virtual Machines are :
* Portability (can run on any OS)
* Easier to manage multiple images. (Dockerfiles, docker-compose, ...)
* A Docker container is lightweight

## Basics

```bash
docker attach		# Attach your terminal input and output into a container
docker images		# List all the images on the host machine
docker ps		# List all containers on the host machine
docker rename		# Rename an existing container
docker restart		# Restart one or multiple container
docker rm		# Remove one or multiple container
docker rmi		# Remove one or multiple images
docker run		# Start a new container based on an image
docker start		# Start one or more stopped containers
docker stop		# Stop one or more running containers

docker pull		# Pull a docker images from DockerHub
docker push		# Push your docker image to DockerHub
docker commit		# Update the image of your container
```

Those commands are the basics one used when deploying simple Container using Docker
<br>
**Be aware that for each of those command, it exist a lot of parameter (--help)**
