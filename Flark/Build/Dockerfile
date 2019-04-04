##############################################################
#Spark Section, but may only need the copy commands below

FROM openjdk:8-alpine

ARG spark_dir=Spark 
#/home/josiah/Projects/repos/spark-2.4.0-bin-hadoop2.7
ARG spark_jars=jars
ARG img_path=kubernetes/dockerfiles
ARG k8s_tests=kubernetes/tests

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat linux-pam && \
    apk add --no-cache nss && \
    #Added above line by JAKB
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/work-dir && \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

COPY ${spark_dir}/bin /opt/spark/bin
COPY ${spark_dir}/sbin /opt/spark/sbin
COPY ${spark_dir}/${spark_jars} /opt/spark/jars

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir
#################################################################
#Kubectl section

#FROM alpine:3.8

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME=/config

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    # Basic check it works.
    kubectl version --client

####################################################################
#Flask section

#FROM ubuntu:latest
#RUN apt-get update -y
RUN apk add --no-cache python && \
    apk add --no-cache python3 && \
    python -m ensurepip && \
    python3 -m ensurepip && \
    # We remove ensurepip since it adds no functionality since pip is
    # installed on the image and it just takes up 1.6MB on the image
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools 
    # You may install with python3 packages by using pip3.6
    # Removed the .cache to save space
    #rm -r /root/.cache #Doesn't seem to be there JAKB

#RUN apt-get install -y python-pip python-dev build-essential
#WORKDIR /home
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
