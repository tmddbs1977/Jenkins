FROM jenkins/jenkins:lts
USER root
RUN apt-get install git curl
COPY ./awscli-install.sh awscli-install.sh
COPY ./jenkins-in-docker-install.sh jenkins-in-docker-install.sh
RUN chmod u+x awscli-install.sh && ./awscli-install.sh && \
    chmod u+x jenkins-in-docker-install.sh && ./jenkins-in-docker-install.sh
