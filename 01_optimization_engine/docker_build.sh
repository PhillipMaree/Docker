#!/bin/bash
docker build --rm -f Dockerfile --build-arg COINHSL_SRC_PATH=./coinhsl/coinhsl-2019.05.21.tar.gz  --build-arg CPLEX_SRC_PATH=./cplex/COSCE129LIN64.bin -t jpmaree/optimization_engine:latest .
