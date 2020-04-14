#!/bin/bash
docker build --rm -f Dockerfile --build-arg USER_NAME=$USER -t jpmaree/ide:latest .
#docker rmi -f jpmaree/optimization_engine
