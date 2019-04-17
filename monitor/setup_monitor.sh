#TODO setup custom-metrics namespace
kubectl create -f deploy/kube-prometheus-manifests
sh deploy/kube-prometheus-custom-metrics-api/deploy.sh
kubectl create -f deploy
