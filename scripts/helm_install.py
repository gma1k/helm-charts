#!/usr/bin/env python3

import subprocess

def install_helm():
  subprocess.run(["curl", "-fsSL", "-o", "get_helm.sh", "https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"])
  subprocess.run(["chmod", "+x", "get_helm.sh"])
  subprocess.run(["./get_helm.sh"])

def configure_helm():
  subprocess.run(["kubectl", "create", "serviceaccount", "--namespace", "kube-system", "tiller"])
  subprocess.run(["kubectl", "create", "clusterrolebinding", "tiller-cluster-rule", "--clusterrole=cluster-admin", "--serviceaccount=kube-system:tiller"])
  subprocess.run(["helm", "init", "--service-account", "tiller", "--history-max", "200"])

def check_helm():
  result = subprocess.run(["helm", "version"], capture_output=True)
  if result.returncode == 0:
    print("Helm is installed and configured")
    return True
  else:
    print("Helm is not installed or configured")
    return False

def main():
  if not check_helm():
    install_helm()
    configure_helm()
    check_helm()

if __name__ == "__main__":
  main()
