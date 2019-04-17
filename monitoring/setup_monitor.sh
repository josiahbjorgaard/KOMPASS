#TODO setup custom-metrics namespace
kubectl create -f deploy/kube-prometheus-manifests
kubectl create -f deploy/kube-prometheus-custom-metrics-api
kubectl create -f deploy
