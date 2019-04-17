#!/bin/bash
#This is a bash script to run the set-up of KOMPASS
cd iac
terraform init <<< 'yes'
terraform apply <<< 'yes'
./finish_eks_setup.sh
cd ../autoscaling
./setup-autoscaler.sh
cd ../frontend
./setup-frontend.sh
cd ../monitor
./setup-monitor.sh
cd ../
echo 'Complete'
