start the minikube tunnel

1. make sure istio is installed
    ```
    ./downloadistio.sh
    ```
1. move istioctl into bin
1. provision cluster
1. minikube tunnel
1. provision dashboard
1. Show kiali dashboard
    ```sh
    istioctl dashboard kiali
    ```
1. Show grafana dashboard
    ```sh
    istioctl dashboard grafana
    ```

```
minikube tunnel
```