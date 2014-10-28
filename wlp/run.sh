#!/usr/bin/env bash

chcon -t svirt_sandbox_file_t ./dropins ./logs ./apps
#docker run -it --rm=true --entrypoint=/bin/bash ewer:wlp
docker run --name="wlp" --hostname="wlp" --link=lxewerMysql:db  --dns=89.0.5.116 --dns-search=hartter.com -c 100 -m 1g -d -P -v /home/ewer/prod/docker/wlp/apps:/opt/wflp/usr/hsf2/apps -v /home/ewer/prod/docker/wlp/dropins:/opt/wlp/usr/servers/hsf2/dropins -v /home/ewer/prod/docker/wlp/logs:/opt/wlp/usr/servers/hsf2/logs ewer:wlp

