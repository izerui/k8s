cd /home/k8s/
git pull
export APP_NAME=admin-server
export APP_VERSION=1.0.0
export APP_PORT=33011
export PROFILE=dev
export BUILD_SH=jar.sh
export REGISTRY_GROUP=harbor.yj2025.com
sh ./build.sh
