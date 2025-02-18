# 🐳 Dockerized Property-Management

[![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Ready-blue.svg)](https://docs.docker.com/compose/)
[![Django](https://img.shields.io/badge/Django-5.1-blue?)](https://www.djangoproject.com/)
[![Python 3.10](https://img.shields.io/badge/Python-3.10-blue.svg)](https://www.python.org/downloads/release/python-3100/)
[![PostgreSQL 16.1](https://img.shields.io/badge/PostgreSQL-16.1-blue.svg)](https://www.postgresql.org/)
[![MongoDB 4](https://img.shields.io/badge/MongoDB-4-green.svg)](https://www.mongodb.com/try/download/community)
[![Node.js Alpine](https://img.shields.io/badge/Node.js-Alpine3.18-green.svg)](https://nodejs.org/en/)



Welcome to this fully Dockerized Django project. With a single command, you get everything up and running—PostgreSQL, MongoDB, and Django, all pre-configured and ready to go.  

📌 Prerequisites:  
Before running the project, ensure you have the following installed:

* Docker 🐳 (Install: Docker)
* Docker Compose (Comes with Docker Desktop)   

### 🚀 Quick Start

To start the project, simply run:
```
docker compose up -d
```

This creates MongoDB and PostgreSQL with predefined users and databases and Launch Django:
* Django **0.0.0.0:8000**
* PostgreSQL **localhost:5432**
* MongoDB	**localhost:27017**

**Note:** The -d flag runs the containers in the background.

### Optional

To speed up the build process and avoid unnecessary image downloads at runtime, you can pull the required images beforehand:
```
docker pull python:3.10-slim-bullseye
docker pull postgres:16.1
docker pull node:alpine3.18
docker pull mongo:4
```

If you need to check logs or debug:
```
docker compose logs -f
```
To access the running Django container:
```
docker exec -it <django_container_id> bash
```   


### 🧼 Stopping & Cleaning Up

To stop all containers and remove relevant images:
```
docker compose down --rmi all
```
If you made any changes in docker files and want fresh restarting:
```
docker compose down --build
```
This will down and start containers auto. you can also change `RE_CACHE` ARG in compose.yaml to control re caching of django's Dockerfile from specific line (to apply changes in build proccess.
