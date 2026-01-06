*This project has been created as part of the 42 curriculum by emyildir*

# Description

This project is about learning Docker and Docker Compose to set up a different services.
The goal is to set up a WordPress server with Nginx and MariaDB. Each service runs in its own dedicated container.

## Instructions

Before running the project configure listed files:

```
./secrets/*
./srcs/.env
```

To build and start the project, run the following command in the root directory:

```
make run 
```

To stop the running containers:

```
make stop
```

To start the containers if they are already built:

```
make start
```

To remove all containers and networks:

```
make clean
```

To remove everything, including volumes:

```
make fclean
```

## Resources

- [Docker Installation](https://docs.docker.com/engine/install/)
- [Docker File Docs](https://docs.docker.com/get-started/docker-concepts/building-images/)
- [Docker Compose Docs](https://docs.docker.com/reference/compose-file/)

__AI USAGE__

Google Gemini was used while developing this project. The main purpose of using it was debugging. It was also used to get fast answers to questions related to Docker and Docker Compose fundamentals, rather than searching for them in the documentation.

About the codebase the initial structures of the Docker Compose file and Dockerfiles were written by me, but I used AI to analyze and remove unnecessary structures (Such as keywords that has default values which is working for me while defining Docker services, networks, and volumes).

I also used it while writing these documentation files to ensure they were properly translated into English.


## Project description

So in this project I created one Dockerfile for each service. Of course this wasn't my choice every service were different from each other so in order to create different docker images for them i needed to have different dockerfiles. 

Also there is one config file for each one of them too. Every single service has their configuration file needed. I could use commands like echo to write them inside Dockerfile but copying from host machine is best practice for later. Like it makes it easier to modify.

And as you see there is a entrypoint script file inside every single service too. I needed to run some commands that requires environment variables which are not reachable inside Dockerfiles. And even it did it shouldn't be making sense because once an image gets compiled even after changing variable it wouldnt be effected.

And I think I should have an explanation for nginx script too. I ran creating certificate command on script because a private thats inside the image which is reachable is reachable from others too. So we are just keeping inside a script that get runs from container to keep it safe. 

#### VIRTUAL MACHINES VS DOCKER 
So this is an easy one. Virtual machines are cool to seperate project from host and probably the best one out there but they cost more than docker container. 
If you setup an virtual machine it should have its own kernel module running which costs space and ofcourse cpu and ram power. In the other hand dockers servers runtime environment to run containers of its own for different platforms that uses same kernel as operating system. This is more efficient rather than virtual machines. And for this reason even virtual machines are better in containerization docker wins.

#### Secrets vs Environment Variables
So in every project there are variables like passwords, usernames, domains etc. And they should be configurable so we use tools to have them as environment variables. But is it completely safe? No. 

If someone reaches out the running process they are able to access env variables. And think that someone does it and accesses your admin password or worse database password. Yes its over. 

So we have secrets! Every configuration option that will lead it to going over is a secret. Your db password your root user username everything! Docker servers these secrets files to the containers and handleing them is up to you ofcourse. 

#### Docker Network vs Host Network

So docker servers an internal network service. Services can communicate with each other with service names if they are connected to the same network. These services can't communicate with outside world if there are no ports opened to it.

On the other hand host network is not private its accessible from host just like any other service running inside it.

#### Docker Volumes vs Bind Mounts

So docker volumes are handled by docker in somewhere inside host filesystem. When a container starts docker just giving it some space and make file operations inside it. Everything is selfworking and shouldn't be modified manually.

In the other hand there is bind mounts. They are like symlinks to our host machine. Linked paths between our computer and docker container. If you setup a bind mount you can easily track, modify the files inside container.




