#!/bin/bash
#This is a bash script to run the set-up of KOMPASS
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
