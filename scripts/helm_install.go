package main

import (
	"fmt"
	"os"
	"os/exec"
)

func installHelm() {
	cmd := exec.Command("curl", "-fsSL", "-o", "get_helm.sh", "https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
	cmd = exec.Command("chmod", "+x", "get_helm.sh")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
	cmd = exec.Command("./get_helm.sh")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
}

func configureHelm() {
	cmd := exec.Command("kubectl", "create", "serviceaccount", "--namespace", "kube-system", "tiller")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
	cmd = exec.Command("kubectl", "create", "clusterrolebinding", "tiller-cluster-rule", "--clusterrole=cluster-admin", "--serviceaccount=kube-system:tiller")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
	cmd = exec.Command("helm", "init", "--service-account", "tiller", "--history-max", "200")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
}

func checkHelm() bool {
	cmd := exec.Command("helm", "version")
	out, err := cmd.Output()
	if err != nil {
		fmt.Println("Helm is not installed or configured")
		return false
	} else {
		fmt.Println("Helm is installed and configured")
		fmt.Println(string(out))
		return true
	}
}

func main() {
	if !checkHelm() {
		installHelm()
		configureHelm()
		checkHelm()
	}
}
