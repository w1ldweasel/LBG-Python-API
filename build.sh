#!/bin/bash

docker build -t w1ldweasel/api-app:latest .
docker push w1ldweasel/api-app:latest

docker stop api-service
docker rm api-service
docker run -d -p 8080:8080 --name api-service w1ldweasel/api-app:latest

