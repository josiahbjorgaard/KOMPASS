bin/spark-submit \
    --master k8s://http://127.0.0.1:8001 \
    --deploy-mode cluster \
    --name spark-pi-2 \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=$1 \
    --conf spark.kubernetes.container.image=josiahbjorgaard/spark \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    local:///opt/spark/examples/jars/spark-examples_2.11-2.4.0.jar 
#    local:///path/to/examples.jar
