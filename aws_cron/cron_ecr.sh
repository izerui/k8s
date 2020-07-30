#!/bin/bash
token=`aws ecr get-login-password --region cn-northwest-1`
docker login --username AWS --password ${token} 397211945973.dkr.ecr.cn-northwest-1.amazonaws.com.cn
kubectl delete secret aws-ecr-secret -n test
kubectl create secret docker-registry aws-ecr-secret --docker-server=397211945973.dkr.ecr.cn-northwest-1.amazonaws.com.cn --docker-username=AWS --docker-password=${token} --docker-email=40409439@qq.com -n test
exit 0
