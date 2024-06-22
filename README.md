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

helm install node-service -f values-orderservice.yml ./chart/node-k8s
helm uninstall node-service
helm status node-service


```


# Useful Commands

```
kubectl get events
kubectl get pods


export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=node-k8s,app.kubernetes.io/instance=node-service" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8080 to use your application"
kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT



kubectl logs $POD_NAME --follow
kubectl cluster-info dump
kubectl exec -t $POD_NAME -- /bin/bash


```

