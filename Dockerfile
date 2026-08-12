FROM jenkins/jenkins:lts
USER root

# CI/CD 작업에 필요한 기본 패키지 설치
RUN apt-get install git curl

# AWS CLI 설치
COPY ./awscli-install.sh awscli-install.sh

# Jenkins 컨테이너 내부 Docker 환경 구성
COPY ./jenkins-in-docker-install.sh jenkins-in-docker-install.sh
RUN chmod u+x awscli-install.sh && ./awscli-install.sh && \
    chmod u+x jenkins-in-docker-install.sh && ./jenkins-in-docker-install.sh
