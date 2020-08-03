#helm install ./deploy/chart/ --name local-path-storage --namespace dev --set storageClass.provisionerName=local-path
helm install local-path-storage --namespace default ./chart/ -f ./chart/values.yaml
