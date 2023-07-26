# nginx-hello-world
Example of nginx-hello-world Helm chart

## Usage
```
helm install nginx-hello-world ./nginx-hello-world
helm install nginx-hello-world ./nginx-hello-world --set hello-world.replicaCount=3
helm status nginx-hello-world
kubectl get pods,svc,ingress -l app.kubernetes.io/instance=nginx-hello-world
curl http://hello-world.local
```
