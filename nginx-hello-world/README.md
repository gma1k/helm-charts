# ![image](https://github.com/gma1k/helm-charts/assets/138721734/966bf6f0-8aaa-4fb7-b3d1-8dacf21b4b1b)

Example of Hello World Helm chart using nginx-ingress-controller.

## Usage

```
helm install nginx-hello-world ./nginx-hello-world
helm install nginx-hello-world ./nginx-hello-world --set hello-world.replicaCount=3
helm status nginx-hello-world
kubectl get pods,svc,ingress -l app.kubernetes.io/instance=nginx-hello-world
curl http://hello-world.local
```
