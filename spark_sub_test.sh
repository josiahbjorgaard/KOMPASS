~/Projects/repos/spark-2.4.0-bin-hadoop2.7/bin/spark-submit \
    --master k8s://https://18E5198A2BBED57A14DAC19EE756CA31.sk1.us-west-2.eks.amazonaws.com:80 \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=5 \
    --conf spark.kubernetes.container.image=test/spark \
    local:~/Projects/repos/spark-2.4.0-bin-hadoop2.7/examples/jars/spark-examples_2.11-2.4.0.jar
