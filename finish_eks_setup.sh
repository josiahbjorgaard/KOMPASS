aws eks --region us-west-2 update-kubeconfig --name terraform-eks-demo
terraform output config_map_aws_auth
kubectl apply -f config_map_aws_auth.yaml
