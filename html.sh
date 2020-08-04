#!/bin/bash
HTML_FOLDER=docker/${APP_NAME}/target
tar zxvf docker/${APP_NAME}/app.tar.gz -C docker/${APP_NAME}/target
echo ":::::: 生成 Dockerfile"
if [ ! -f "tpl/${APP_NAME}/Dockerfile" ];then
DOCKER_TPL_FILE=tpl/default/Dockerfile
else
DOCKER_TPL_FILE=tpl/${APP_NAME}/Dockerfile
fi
echo ":::::: 使用 ${DOCKER_TPL_FILE}"
eval "cat <<EOF
$(< ${DOCKER_TPL_FILE})
EOF
" > docker/${APP_NAME}/Dockerfile
