1. 创建命名空间:
    kubectl create namespace kubernetes-dashboard
2. 安装证书：
    kubectl create secret generic kubernetes-dashboard-certs --from-file="certs/server.pem,certs/server.key" -n kubernetes-dashboard
3. 安装dashboard：
    kubectl apply -f recommended.yaml
4. 创建admin-user：
    kubectl apply -f auth.yaml
5. 安装ingress：
    kubectl apply -f ingress.yaml
6. 获取token：
    kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
7. 登录：
    https://dashboard.yj2025.com
