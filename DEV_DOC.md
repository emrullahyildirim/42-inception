# Developer Documentation - Inception
This document is for developers who wish to set up and maintain the project.

## Prerequisites

- **Docker & Docker Compose**

- **GNU Make**

- **Domain Mapping:** Configure `emyildir.42.fr` to  `127.0.0.1`

## Environment Setup
You must set up these files before launching:

**Environment Variables (srcs/.env):** Configure given .env file to your like.

**Secrets Management:** Write your secrets inside given files under secrets folder.
- `secrets/db_root_password.txt`
- `secrets/db_user_password.txt`
- `secrets/wp_admin_password.txt`
- `secrets/wp_user_password.txt`

## Managing Services 
To build and start the project, run the following command in the root directory:

### Using Makefile

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
To see statuses of services:
```
make status
```

### Using Docker and Docker Compose

List running containers: 
```
docker ps
```
Build and run:
```
docker-compose -f srcs/docker-compose.yml up -d --build
```
Access the shell of a running service for debugging:
```
docker exec -it <container id> /bin/bash
```
View logs of running container:
```
docker logs <container id>
```

## Data

Storage Locations (Host Machine):

**Database Data:** /home/emyildir/data/mariadb

**WordPress Files:** /home/emyildir/data/wordpress