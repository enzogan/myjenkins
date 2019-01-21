FROM jenkins/jenkins:lts
USER root
RUN chmod 777 /var/jenkins_home
