# Kiratech-Challenge


Installato terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
configurato gcloud: https://cloud.google.com/sdk/docs/install?hl=it#rpm
inizializzato gcloud con le credenziali e creato il progetto kiratech-challenge
installato k3sup e kubectl sul client terraform

curl -sLS https://get.k3sup.dev | sh
k3sup version
dnf install kubectl

gcloud auth application-default login
gcloud compute config-ssh


ssh -i ~/.ssh/google_compute_engine debian@34.17.8.59


export KUBECONFIG=/home/antonio/kiratech-challenge/kubeconfig 
kubectl config use-context k3s
kubectl get node -o wide


