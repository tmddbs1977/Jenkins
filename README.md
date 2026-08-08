# Jenkins 컨테이너 바로 실행

git clone https://github.com/tmddbs1977/Jenkins.git

cd jenkins

chmod u+x docker-install.sh

./docker-install.sh

docker compose up -d

# jenkins Image 생성

docker build -t <DockerHub 계정명>/jenkins:lts .

docker push <DockerHub 계정명>/jenkins:lts

쿠버네티스에서 사용하려면 Dockerfile의 마지막 줄에 추가

RUN curl -LO \
"https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
chmod +x kubectl && mv kubectl /usr/local/bin
