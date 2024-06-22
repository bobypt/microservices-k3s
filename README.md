# microservices-k3s

```
./service.sh build -> Build docker images\n 
/service.sh deploy -> deploy services\n
/service.sh test -> test services\n
/service.sh delete -> delete services\n
```



# Useful Commands

```
kubectl get events
kubectl get pods
kubectl logs <pod-name> --follow
kubectl cluster-info dump
kubectl exec -t <pod-name> -- /bin/bash

helm install <name> -f <values>.yaml <chart-location>
helm uninstall <name>
helm status <name>


```

