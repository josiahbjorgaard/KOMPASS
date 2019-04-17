# KOMPASS (Kubernetes Orchestrated Multi-application Parallel Autoscaling Spark Server)

KOMPASS provides one-click deployment of your team's Apache Spark jobs using automated and resilient scaling of a multi-user, cloud based Spark server built on top of AWS, Kubernetes, and Prometheus. 

[Link](bit.ly/kompass-slides) to presentation.
[Link](bit.ly/kompass-demo) to video.

<hr/>

## Useage

### Prerequisites

The following packages must be installed and configured locally:
* terraform
* docker
* kubectl
* aws-cli

for more information, see the links to the specific project sites below.

An operational Apache Spark 2.4.0 docker image must be pubished to your dockerhub account and accessible by the deployed EKS cluster. The build is automated in the relevant Apache Spark source distributions as detailed in the link below. The following folders need to be copied to the frontend/Docker-Image folder: bin, sbin, jars, examples, or the whole distribution folder can be placed there. Future versions will automate this.

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

<hr/>

## Introduction

KOMPASS allows multiple users to run many different Spark applications on the same EKS resource in an efficient way. It autoscales the number of EC2 instances and Spark clusters in order to meet demand at any given time. Custom metrics from Prometheus are used to predict the upcoming resource needs so that an accomodating number of instances are available when Spark applications need to be run, and then scales back the number of instances to save AWS costs. It is autodeployable with infastructure as code and fully containerized, so developers can spend more time on their Spark applications and less time leveraging the infastruture and dependencies necessary to run them.

## Architecture

* [Kubernetes](https://kubernetes.io/)
* [Docker](https://docker.io)
* [Apache Spark 2.4.0](https://spark.apache.org/releases/spark-release-2-4-0.html)
* [Prometheus](https://prometheus.io/)
* [Grafana](https://grafana.com)
* [Prometheus Operator] (https://coreos.com/operators/prometheus/docs/latest/user-guides/getting-started.html)
* [Flask](https://flask.io/)
* [Terraform](https://terraform.io/)

## Engineering Challenges

## Trade-offs

## Authors

* **Josiah Bjorgaard** - [KOMPASS](https://github.com/josiahbjorgaard/kompass)

## License

This project is licensed under the GNU License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Insight Data Science
