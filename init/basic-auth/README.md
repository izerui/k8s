auth:yunji/yunji.1234

kubectl create secret generic basic-auth-secret --from-file=auth -n dev


使用方式如下：


apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: eureka-ingress
  namespace: dev
  annotations:
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: basic-auth-secret
    nginx.ingress.kubernetes.io/auth-realm: "Authentication Required"
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  tls:
    - secretName: yj2025-secret
      hosts:
        - eureka-dev.yj2025.com
  rules:
    - host: eureka-dev.yj2025.com
      http:
        paths:
          - path: /
            backend:
              serviceName: eureka-service
              servicePort: 80
