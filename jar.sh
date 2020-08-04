#!/bin/bash
JAR_FILE=docker/${PROFILE}/${APP_NAME}/${APP_NAME}-exec.jar
echo ":::::: 生成 Dockerfile"
if [ ! -f "./tpl/${PROFILE}/${APP_NAME}/Dockerfile" ];then
DOCKER_TPL_FILE=tpl/default/Dockerfile
else
DOCKER_TPL_FILE=./tpl/${PROFILE}/${APP_NAME}/Dockerfile
fi
echo ":::::: 使用 ${DOCKER_TPL_FILE}"
eval "cat <<EOF
$(< ${DOCKER_TPL_FILE})
EOF
" > docker/${PROFILE}/${APP_NAME}/Dockerfile
