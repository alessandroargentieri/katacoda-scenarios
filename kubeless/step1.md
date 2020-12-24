# Benvenuti!

In questa esercitazione utilizzeremo un cluster Kubernetes avviato tramite la distribuzione Minikube.

## Avviamo l'ingress
Minikube permette una serie di facilitazioni per abilitare il tuo cluster ad eseguire una serie di operazioni. 
Diamo uno sguardo agli _addons_ che sono abilitati nel nostro cluster Minikube:

`minikube addons list`{{execute}}

Come possiamo vedere, sono già abilitati lo _storage provisioner_ che permette al cluster di provisionare degli spazi di memoria per persistere i dati quando si utilizzano degli oggetti in K8s adibiti alla persistenza e chiamati  _persistent volume claim_.

Adesso vogliamo abilitare l'_ingress_ per permettere ai nostri oggetti K8s di essere raggiunti dall'esterno del nostro cluster:

`minikube addons enable ingress`{{execute}}

Possiamo verificare quando l'ingress è correttamente avviato lanciando:

`kubectl get pod -n kube-system | grep "nginx"`{{execute}}
