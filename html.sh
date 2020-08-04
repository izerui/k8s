#!/bin/bash
HTML_FOLDER=docker/${PROFILE}/${APP_NAME}/target/
rm -rf ${HTML_FOLDER}
mkdir ${HTML_FOLDER}
tar zxvf docker/${PROFILE}/${APP_NAME}/app.tar.gz -C ${HTML_FOLDER}
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
