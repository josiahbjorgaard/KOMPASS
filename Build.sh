terraform apply << yes
sh Prometheus/run_pk_eash.sh
kubectl proxy
sh Spark/setup_kg_spark.sh
