#!/bin/bash

install_helm() {
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod +x get_helm.sh
  ./get_helm.sh
}

configure_helm() {
  kubectl create serviceaccount --namespace kube-system tiller
  kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
  helm init --service-account tiller --history-max 200
}

check_helm() {
  helm version
  if [ $? -eq 0 ]; then
    echo "Helm is installed and configured"
  else
    echo "Helm is not installed or configured"
  fi
}

main() {
  check_helm

  if [ $? -ne 0 ]; then
    install_helm
    configure_helm
    check_helm
  fi

  exit $?
}

main
