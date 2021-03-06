# Docker image template for Zabbix server

Zabbix-LAMP is a special Docker image that is configured to contain ready-to-configure Zabbix Server with related stack in one single container. 

#### Zabbix itself contains:
* Zabbix Server
* Zabbix Agent 
* PHP-based Frontend

#### LAMP stack:
* MySQL Server
* Apache Web Server
* PHP 

### Prerequisites
You need properly installed Docker Engine to use this Dockerfile. Here you can find [official documentations with instructions](https://docs.docker.com/install/) 

### Usage
The image is already build with CI system and uploaded to Docker Hub.
You just need to run the following command in your shell environment to initialize container.

```
docker run -it -p 80:80 nordcave/zabbix-lamp:1.0
```

*Repository is shipped with* ".travis.yaml" *file with configured Travis CI integration. Build is triggered with every new* push *to the master. After build succeed image is pushed to the Docker Hub repository.*