# Kiratech-Challenge

source: https://learnk8s.io/terraform-gke

1 - Installato terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2 - configurato gcloud: https://cloud.google.com/sdk/docs/install?hl=it#rpm
3 - inizializzato gcloud con le credenziali e creato il progetto kiratech-challenge su google cloud 


gcloud auth login 
gcloud auth application-default login
gcloud compute config-ssh


4 - inizializzato terraform, applicato plan e fatto apply 

terraform init 
terraform plan 
terraform apply -auto-approve
terraform destroy -auto-approve


export KUBECONFIG="${PWD}/kubeconfig-prod"
/home/antonio/github-project/Kiratech-Challenge/gke-creation

helm upgrade asn-deployment ../helm-deployment/asn-deployment


