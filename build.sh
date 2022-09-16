#!/bin/bash

docker build -t stratcastor/automated-image:latest .
docker push stratcastor/automated-image:latest

docker stop auto-container
docker rm auto-container
docker run -d -p 8080:8080 --name auto-container stratcastor/automated-image:latest

