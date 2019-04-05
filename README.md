# KOMPASS (Kubernetes Orchestrated Multi-user Parallel Autoscaling Spark Server)

KOMPASS provides one-click deployment of your team's Apache Spark jobs using automated and resilient scaling of a multi-user, cloud based Spark server built on top of AWS, Kubernetes, and Prometheus. 

## Useage

### Prerequisites

The following packages must be installed and operational locally:
* terraform
* kubectl
* aws-cli
for more information, see the links to the specific project sites below.

Additionally, an operational Apache Spark 2.3+ docker image must be pubished to your dockerhub account and accessible by the deployed EKS cluster. The build is automated in the relevant Apache Spark source distributions as detailed in the link below.

### Set-up

Edit the dockerhub user name to reflect your public repository.
To leverage the autodeployment run 
```shell 
./setup-kompass.sh
```
This run terraform to build out the infastructure, compile and publish the front end docker image, deploy the associated services, and deploy the autoscaling features.

### Run

Run ```kubectl get svc kompass-service``` to obtain your ip address for accessing the front end. Enter this into a web browser. From the input fields, you can select the number of nodes, spark example java class, and modifier to add to the call to the examples.jar file.
Submitting the form will run a Spark application and write the stdout from spark-submit to the web browser.

## Tools used by KOMPASS

* [Kubernetes](https://kubernetes.io/)
* [Docker](https://docker.io)
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
