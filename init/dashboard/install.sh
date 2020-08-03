kubectl create namespace kubernetes-dashboard
kubectl create secret tls kubernetes-dashboard-certs --cert tls.crt --key tls.key -n kubernetes-dashboard
kubectl apply -f recommended.yaml
kubectl apply -f ingress.yaml
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard | awk '{print $1}')
