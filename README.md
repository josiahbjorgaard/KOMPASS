# CLASS: CLoud-based Autoscaling Spark Server

CLASS provides one-click deployment of your team's Apache Spark jobs using automated and resilient scaling of a multi-user, cloud based Spark server built on top of AWS, Kubernetes, and Prometheus. 

Value prop.- Companies leveraging data analytics require compute resources to process and analyze data. These compute resources either exceed the amount of required resources at any given time or are provisioned over time. Setting up the use of Spark requires significant time investment from data engineers/scientists to use the compute resources which could be used for focused developments otherwise. A one-click provisioned autoscaling Spark pipeline saves the cost of wasted resources by provisioning only the necessary compute time and saves engineers times setting up pipelines and allows them on demand compute resources.

MVP-One-click deployment of a toy Spark job on an AWS EC2 instance.

Eng. Challenge - Containerizing Spark pipelines and running multiple Spark jobs on a Kubernetes cluster.

## Built With

* [Kubernetes](https://kubernetes.io/)
* [Apache Spark 2.4.0](https://spark.apache.org/releases/spark-release-2-4-0.html)
* [Prometheus](https://prometheus.io/)

## Authors

* **Josiah Bjorgaard** - *Initial work* - [CLASS](https://github.com/josiahbjorgaard/class)

## License

This project is licensed under the GNU License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Insight Data Science
