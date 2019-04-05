docker build Build -t josiahbjorgaard/KOMPASS-front-end:latest
docker push josiahbjorgaard/KOMPASS-front-end:latest
kubectl create -f deploy
