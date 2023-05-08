# #!/bin/bash
# # kind create istio-demo &&
minikube start &&
kubectl create namespace tutorial &&
istioctl install --set profile=demo -y &&
kubectl label namespace default istio-injection=enabled &&
kubectl label namespace tutorial istio-injection=enabled &&
echo "Provisioning demo..." &&
kubectl apply -f istio-1.17.2/samples/bookinfo/platform/kube/bookinfo.yaml &&
echo "Validating installation..." &&
kubectl rollout status deployment/reviews-v3 &&
echo "bookinfo validated..." &&
kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>" &&
echo "Installation complete." &&
echo "Installing gateway..." &&
kubectl apply -f istio-1.17.2/samples/bookinfo/networking/bookinfo-gateway.yaml &&
echo "Validating gateway..." &&
istioctl analyze