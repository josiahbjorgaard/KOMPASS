cd autodeploy
terraform init <<< 'yes'
terraform apply <<< 'yes'
./finish_eks_setup.sh
cd ../autoscale
./setup-autoscale.sh
cd ../frontend
./setup-frontend.sh
cd ../
echo 'Complete'
