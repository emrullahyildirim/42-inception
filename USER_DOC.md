# User Documentation

This documentation contains information about how to access and manage running services on this project. 

## Services

- **Nginx:** Handles all coming requests and redirects them to the wordpress service if secure.
- **Wordpress**: Service that manages website.
- **MariaDB**: Database that stores all site data.

## Managing Services 
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
To see statuses of services:
```
make status
```

## Accessing Services

**Website:** https://emyildir.42.fr

**Wordpress Dashboard:** https://emyildir.42.fr/wp-admin

## Configuring Credentials
All sensitive passwords are set by under the path given. You can modify them to configure admin's and user's password.
```
secrets/db_root_password.txt  
secrets/db_user_password.txt  
secrets/wp_admin_password.txt  
secrets/wp_user_password.txt
```

Also If you want to configure the usernames or emails of the user you can modify .env file provided inside /srcs folder.
```
PATH: srcs/.env 

...
ADMIN_USERNAME: To configure Admin's username
ADMIN_EMAIL: To configure Admin's email
...
SITE_USER: To configure users username
SITE_USER_EMAIL:  To configure users email
...
DB_USER: To configure database user username
```




