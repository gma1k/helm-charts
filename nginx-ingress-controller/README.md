# ![image](https://github.com/gma1k/helm-charts/assets/138721734/bb89aecc-fac5-4368-a356-a19f65026611)


Example of installing nginx-ingress-controller using Helm chart.

## Table of Contents

- [Features](#features)
- [Usage](#usage)

## Features

- **Helm**
- **nginx-ingress-controller**
- **Docker**
- **gitlab-ci**

## Usage

```
helm install nginx-hello-world ./nginx-hello-world
helm install nginx-hello-world ./nginx-hello-world --set hello-world.replicaCount=3
helm status nginx-hello-world
kubectl get pods,svc,ingress -l app.kubernetes.io/instance=nginx-hello-world
curl http://hello-world.local
```
