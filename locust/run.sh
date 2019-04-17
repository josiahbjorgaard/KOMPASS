locust --host=http://$(kubectl get svc/kompass-service|tail -1| awk '{print $4}')
