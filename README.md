# Kiratech-Challenge


1 - Installato terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2 - configurato gcloud: https://cloud.google.com/sdk/docs/install?hl=it#rpm
3 - inizializzato gcloud con le credenziali e creato il progetto kiratech-challenge su google cloud 


gcloud auth login 
gcloud auth application-default login
gcloud compute config-ssh


 4 - installato k3sup e kubectl sul bastion host 

curl -sLS https://get.k3sup.dev | sh
k3sup version
dnf install kubectl



5 - inizializzato terraform, applicato plan e fatto apply 



ssh -i ~/.ssh/google_compute_engine debian@34.17.8.59
export KUBECONFIG=/home/antonio/kiratech-challenge/kubeconfig 
kubectl config use-context k3s
kubectl get node -o wide


