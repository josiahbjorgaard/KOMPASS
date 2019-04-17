kubectl --namespace monitoring port-forward svc/grafana 3000 &
kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090 &
