# KOMPASS

## Autoscaling deployment
Run 
```shell
./config_monitor.sh
``` 
to set-up monitoring. \br
Sets up kube-prometheus manifests from the Prometheus Operator (includes Grafana, kube-state-metrics, node-exporter) and the custom-metrics-api from kube-prometheus that uses the Prometheus-adapter.
The Grafana dashboard can be used to monitor autoscaling properties.
