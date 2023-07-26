#!/usr/bin/env ruby

require "open3"

def install_helm
  system("curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3")
  system("chmod +x get_helm.sh")
  system("./get_helm.sh")
end

def configure_helm
  system("kubectl create serviceaccount --namespace kube-system tiller")
  system("kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller")
  system("helm init --service-account tiller --history-max 200")
end

def check_helm
  stdout, stderr, status = Open3.capture3("helm version")
  if status.success?
    puts "Helm is installed and configured"
    return true
  else
    puts "Helm is not installed or configured"
    return false
  end
end

def main
  unless check_helm
    install_helm
    configure_helm
    check_helm
  end
end

main
