#!/bin/sh
sleep 10
sudo apt update
sudo apt install runc docker.io -y
sudo docker run --name reddit -d -p 9292:9292 dinky98/otus-reddit:1.0

