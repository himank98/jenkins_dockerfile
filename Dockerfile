FROM ubuntu:20.04

RUN apt-get update && apt-get install wget gnupg -y

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

RUN echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/jenkins.list

RUN apt-get update && apt-get install jenkins openjdk-11-jdk -y 

CMD java  -jar  /usr/share/jenkins/jenkins.war 

