kubectl proxy &
echo "Thank you for running KOMPASS!"
echo "Running Spark-submit using $2 on $1 nodes with the input $3"
Spark/bin/spark-submit \
    --master k8s://http://127.0.0.1:8001 \
    --deploy-mode cluster \
    --name spark \
    --class org.apache.spark.examples.$2 \
    --conf spark.executor.instances=$1 \
    --conf spark.kubernetes.container.image=josiahbjorgaard/spark \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
    local:///opt/spark/examples/jars/spark-examples_2.11-2.4.0.jar $3
echo "Finished running Spark-submit!"
