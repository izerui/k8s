#!/bin/bash
# ------------------------     一。设置初始变量
#export APP_NAME=eureka-config-server
#export APP_VERSION=1.0.0
#export APP_PORT=3030
#export PROFILE=dev
#export BUILD_SH=jar.sh
#export REGISTRY_GROUP=harbor.yj2025.com
#sh ./build.sh
TIME=$(date "+%Y-%m-%d %H:%M:%S")
git pull
# ------------------------     二。编译镜像
echo ":::::: 开始打包"
echo ":::::: APP_NAME=${APP_NAME}"
echo ":::::: APP_VERSION=${APP_VERSION}"
echo ":::::: APP_PORT=${APP_PORT}"
echo ":::::: PROFILE=${PROFILE}"
echo ":::::: BUILD_SH=${BUILD_SH}"
echo ":::::: REGISTRY_GROUP=${REGISTRY_GROUP}"
echo " ------------------------- "

# 执行编译
./${BUILD_SH}
#git tag -a ${tagName} -m '上线发布'
git add .
git commit -m '${APP_NAME}-${TIME}'
git push -u origin master
# -------------------------    三。发布镜像
#========================================================================
echo ":::::: 发布镜像"
REGISTRY_URL=${REGISTRY_GROUP}/${PROFILE}/${APP_NAME}:${APP_VERSION}
docker build -f docker/${APP_NAME}/Dockerfile -t ${PROFILE}/${APP_NAME}:${APP_VERSION} .
docker tag ${PROFILE}/${APP_NAME}:${APP_VERSION} ${REGISTRY_URL}
docker push ${REGISTRY_URL}
echo ":::::: 打包完成: ${REGISTRY_URL}"

# -------------------------    四。重启服务
echo ":::::: 重启应用"
if [ ! -f "./tpl/${APP_NAME}/app.yaml" ];then
YAML_TPL_FILE=./tpl/default/app.yaml
else
YAML_TPL_FILE=./tpl/${APP_NAME}/app.yaml
fi
echo ":::::: 使用 ${YAML_TPL_FILE}"
eval "cat <<EOF
$(< ${YAML_TPL_FILE})
EOF
" > docker/${APP_NAME}/app.yaml
kubectl apply -f docker/${APP_NAME}/app.yaml
echo ":::::: 重启完成"
