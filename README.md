# Jenkins Docker 환경

AWS IaC 및 CI/CD 프로젝트에서 Jenkins 서버를 Docker 기반으로 구성하기 위한 저장소입니다.

Ansible을 통해 Jenkins EC2를 생성한 후 User Data에서 이 저장소를 Clone하고, Docker 설치 및 Jenkins 컨테이너 실행까지 자동으로 수행하도록 구성했습니다.

| 파일                             | 설명                                           |
| ------------------------------ | -------------------------------------------- |
| `Dockerfile`                   | Jenkins LTS 기반 커스텀 이미지 구성                    |
| `docker-compose.yml`           | Jenkins 컨테이너 실행 및 Volume, Docker Socket 설정   |
| `docker-install.sh`            | Jenkins EC2에 Docker 및 Docker Compose 설치      |
| `awscli-install.sh`            | Jenkins Pipeline에서 사용할 AWS CLI 설치            |
| `jenkins-in-docker-install.sh` | Jenkins 컨테이너 내부에서 Docker 명령을 사용할 수 있도록 환경 구성 |

## ⚙️ Jenkins 구성 흐름

```text
Ansible
   ↓
Jenkins EC2 생성
   ↓
User Data 실행
   ↓
Jenkins Repository Clone
   ↓
Docker 설치
   ↓
Docker Compose 실행
   ↓
Jenkins Container 실행
```

Jenkins는 AWS Private Subnet의 EC2에 배치하고 Docker 컨테이너로 실행했습니다.

Jenkins Pipeline에서 Docker 이미지 Build/Push 및 AWS S3·CodeDeploy 관련 작업을 수행할 수 있도록 Docker 환경과 AWS CLI를 Jenkins 이미지에 포함했습니다.

## 🚀 실행 방법

```bash
git clone https://github.com/tmddbs1977/Jenkins.git
cd Jenkins

chmod u+x docker-install.sh
./docker-install.sh

docker compose up -d
```

## 🐳 Jenkins Image

Jenkins 커스텀 이미지는 `Dockerfile`을 통해 생성합니다.

```bash
docker build -t <DockerHub 계정명>/jenkins:lts .
docker push <DockerHub 계정명>/jenkins:lts
```

## 🔗 관련 프로젝트

본 저장소는 **IaC를 활용한 AWS 인프라 구축 및 CI/CD 자동화 프로젝트**에서 Jenkins 서버 구성에 사용했습니다.

* AWS IaC + CI/CD Project
  https://github.com/tmddbs1977/aws-iac-cicd-project
