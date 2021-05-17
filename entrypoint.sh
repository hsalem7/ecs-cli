#!/bin/sh -l
ecs-cli --version

ecs-cli configure --cluster $1 --region $2

ecs-cli compose --project-name=$3 service up
