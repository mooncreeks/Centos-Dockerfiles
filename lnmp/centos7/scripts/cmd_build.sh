#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

#build mooncreeks/mysql:5.6 image
docker build -f "$DIR"/../mysql/Dockerfile -t mooncreeks/mysql:5.6 ../mysql

