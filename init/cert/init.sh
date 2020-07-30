#!/bin/bash
kubectl delete secret yj2025-secret -n dev
kubectl create secret tls yj2025-secret --cert server.pem --key server.key -n dev
