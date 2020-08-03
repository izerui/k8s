# 通过helm 安装 nginx-ingress-controller
# 修改nginx-deployment 的 nodeName: nginx211 或者 nodeSelector: kubernetes.io/hostname: nginx211
# 修改nginx-service 的 nodePort: 分别为 32562、32563 对应容器的 80、443
