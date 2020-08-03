export APP_NAME=eureka-config-server
export APP_VERSION=1.0.0
export APP_PORT=3030
export PROFILE=dev
export BUILD_SH=jar.sh
export REGISTRY_GROUP=harbor.yj2025.com
cd /home/k8s/
sh ./build.sh
