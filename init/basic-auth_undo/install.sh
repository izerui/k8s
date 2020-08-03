kubectl delete secret basic-auth -n dev
kubectl create secret generic basic-auth --from-file=auth -n dev
kubectl get secret basic-auth -o yaml -n dev
