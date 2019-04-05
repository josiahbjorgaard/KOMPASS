# KOMPASS (Kubernetes Orchestrated Multi-user Parallel Autoscaling Spark Server)

KOMPASS provides one-click deployment of your team's Apache Spark jobs using automated and resilient scaling of a multi-user, cloud based Spark server built on top of AWS, Kubernetes, and Prometheus. 

## Useage

###Prerequisites

The following packages must be installed and operational locally:
* terraform
* kubectl
* aws-cli
for more information, see the links to the specific project sites below.

Additionally, an operational Apache Spark 2.3+ docker image must be pubished to your dockerhub account and accessible by the deployed EKS cluster. The build is automated in the relevant Apache Spark source distributions as detailed in the link below.

###Build

Edit the dockerhub user name to reflect your public repository.

Run '''shell ./setup-kompass.sh''' to leverage the autodeployment, build and publish the front end docker image, and deploy the autoscaling features.

###Run

Run '''shell kubectl get svc kompass''' to obtain your ip address for accessing the front end. Enter this into a web browser to gain access to the front end interface. From this, you can select the number of nodes, spark example java class, and modifier to add to the call to the examples.jar file.

## Tools used by KOMPASS

* [Kubernetes](https://kubernetes.io/)
* [Apache Spark 2.4.0](https://spark.apache.org/releases/spark-release-2-4-0.html)
* [Prometheus](https://prometheus.io/)
* [Flask](https://flask.io/)
* [Terraform](https://terraform.io/)

## Authors

* **Josiah Bjorgaard** - *Initial work* - [KOMPASS](https://github.com/josiahbjorgaard/kompass)

## License

This project is licensed under the GNU License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Insight Data Science
