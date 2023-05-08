#!/bin/bash
kubectl apply -f istio-1.17.2/samples/addons &&
kubectl rollout status deployment/kiali -n istio-system

# Access the Kiali dashboard
# istioctl dashboard kiali