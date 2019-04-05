#!/bin/bash
#This is a bash script to build and deploy the KOMPASS front end
docker build Docker-Image -t josiahbjorgaard/kompass:latest
docker push josiahbjorgaard/kompass:latest
kubectl create -f deploy
kubectl create serviceaccount spark
kubectl create clusterrolebinding spark-role \
    --clusterrole=edit \
    --serviceaccount=default:spark \
    --namespace=default
