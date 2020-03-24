#!/bin/bash
docker build --rm -f Dockerfile --build-arg USER_NAME=$USER -t jpmaree/optimization_ide:latest .
