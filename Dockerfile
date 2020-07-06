FROM ubuntu:20.04

RUN apt-get update && apt-get install wget gnupg -y

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

RUN echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/jenkins.list

RUN apt-get update && apt-get install jenkins openjdk-11-jdk unzip -y 

RUN apt-get install curl -y

EXPOSE 8080

COPY install-plugins.sh  /usr/local/bin/install-plugins.sh

COPY jenkins-support  /usr/local/bin/jenkins-support

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

CMD java  -jar  /usr/share/jenkins/jenkins.war

