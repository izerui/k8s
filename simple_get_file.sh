#!/bin/bash
export APP_NAME=eureka-config-server
export APP_VERSION=1.0.0
export APP_PORT=3030
export PROFILE=test
export REGISTRY_GROUP=harbor.yj2025.com
export ROOT_PATH=/home/docker
if [ ! -f "./tpl/yaml/${APP_NAME}.yaml" ];then
echo "文件不存在 使用 app.yaml"
else
echo "文件存在 使用 ${APP_NAME}.yaml"
fi
