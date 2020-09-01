kubectl delete secret harbor-secret -n yunji
kubectl create secret docker-registry harbor-secret --docker-server=harbor.yj2025.com --docker-username=admin --docker-password=Root1234 --docker-email=hr@ecworking.com -n yunji
