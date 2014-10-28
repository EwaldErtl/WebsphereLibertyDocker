#!/usr/bin/env bash

docker rmi ewer:wlp
docker build --force-rm=true --rm=true -t ewer:wlp . 

