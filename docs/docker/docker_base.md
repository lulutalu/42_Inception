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
docker build		# Build an image based on a PATH or an URL
docker images		# List all the images on the host machine
docker network		# Let you manage the Docker's network
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

Those commands are the based one used when deploying simple Container using Docker
<br>
**Be aware that for each of those command, it exist a lot of parameter (--help)**

### Useful commands

```bash
docker rm $(docker ps -q)		# Remove all the containers. (The containers need to be stopped or use -f to force)
docker rmi $(docker images -qa)		# Remove all the images
docker run -d				# The '-d' option stands for 'detach'. This means that the container will run in the background
docker run -p				# The '-p' option stands for 'publish'. This reserve a port of the host machine to the container
docker run --rm				# Automatically remove the container when it exits
docker run --name			# Let you choose the name of your container
docker build -t				# Let you name the image as you want
```

## Volumes

As it is, the data of a container aren't persistent. Once the container is shut down,
the inner data of the container get deleted. To allow for persistent database we're
gonna use the ***Volumes***.

Basically, the volumes provides the ability to connect the filesystems of the container
to the host machine. Granting a constant data collection even when the container is
shut down. This is especially useful when hosting database to guarantee no lost of
data even if the container unvoluntarily shutdown.

```bash
docker volume create [OPTIONS] [NAME]		# Create a volume
docker volume [OPTIONS] name			# Access information of the volume (json file)
docker volume ls [OPTIONS]			# List of all created volumes
docker volume prune				# Remove all unused volumes
docker volume rm 				# Remove one or more volumes
```

Here is an example of creation and mounting of a volume :
```bash
docker volume create myOwnDB
docker run -d --mount type=volume,src=myOwnDB,target=database/myOwn "name_of_image"
```

for more [info](https://docs.docker.com/storage/volumes/)

- ## [**PREV**](../mandatory/mandatory.md)
- ## [**NEXT**](dockerfile.md)
