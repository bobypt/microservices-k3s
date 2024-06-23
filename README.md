# microservices-k3s

```
./service.sh build -> Build docker images\n 
/service.sh deploy -> deploy services\n
/service.sh test -> test services\n
/service.sh delete -> delete services\n
```

# Helm

```
mkdir chart
cd chart

helm create node-k8s

helm install order-service -f values-orderservice.yml ./chart/node-k8s
helm uninstall order-service
helm uninstall customer-service
helm uninstall customer-service


helm status order-service
helm upgrade order-service -f values-orderservice.yml ./chart/node-k8s

helm install customer-service -f values-customerservice.yml ./chart/node-k8s




```

## Nginx ingress
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true

kubectl get pods --all-namespaces -l app=nginx-ingress-nginx-ingress


kubectl logs service/nginx-ingress-controller --follow

kubectl exec -t pod/nginx-ingress-controller-67dccd78d7-tzkqp -- /bin/bash

# verify

curl http://127.0.0.1:80/customer-service/api/v1/customerapi/health
curl http://127.0.0.1:80/order-service/api/v1/orderapi/health

# Useful Commands

```
kubectl get events
kubectl get pods
kubectl get all

kubectl get ingress -A


kubectl describe ingress node-k8s-ingress



export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=node-k8s,app.kubernetes.io/instance=order-service" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8080 to use your application"


kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT



kubectl logs $POD_NAME --follow
kubectl cluster-info dump
kubectl exec -t $POD_NAME -- /bin/bash


```

