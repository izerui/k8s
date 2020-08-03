kubectl delete secret basic-auth-secret -n dev
kubectl create secret generic basic-auth-secret --from-file=auth -n dev
