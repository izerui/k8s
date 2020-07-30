#!/bin/bash
export APP_NAME=eureka-config-server
export APP_VERSION=1.0.0
export APP_PORT=3030
export PROFILE=test
export REGISTRY_GROUP=harbor.yj2025.com
export ROOT_PATH=/home/docker
eval "cat <<EOF
$(< ./tpl/yaml/app.yaml)
EOF
" > temp/app1.yaml
