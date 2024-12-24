#!/bin/bash
docker apt-get install docker.io -y 
sudo usermod -aG docker $USER && newgrap docker 