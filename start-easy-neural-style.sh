#!/bin/bash

# make prerequisite repositories on host
mkdir ~/neural-style
mkdir ~/neural-style/style-inputs
mkdir ~/neural-style/content-inputs
mkdir ~/neural-style/outputs

# start docker-machine with high memory settings

# if docker machine exists, start it up
if docker-machine ls -q | grep 'ns-machine' == 0; then
    docker-machine start ns-machine
# else, create machine with high memory settings
else     
    docker-machine create -d virtualbox --virtualbox-memory 6348 ns-machine
fi
# start docker daemon
eval $(docker-machine env default)

docker run -v ~/neural-style/content-inputs:/root/neural-style/content-inputs -v ~/neural-style/style-inputs:/root/neural-style/style-inputs -v ~/neural-style/outputs:/root/neural-style/outputs --name easy-neural-style -ti rochong/easy-neural-style
