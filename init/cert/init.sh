#!/bin/bash
kubectl delete secret yj2025-secret -n default
kubectl delete secret yj2025-secret -n dev
kubectl delete secret yj2025-secret -n test
kubectl create secret tls yj2025-secret --cert tls.crt --key tls.key -n default
kubectl create secret tls yj2025-secret --cert tls.crt --key tls.key -n dev
kubectl create secret tls yj2025-secret --cert tls.crt --key tls.key -n test
