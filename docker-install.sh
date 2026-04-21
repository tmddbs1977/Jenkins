#!/bin/bash

# 에러 발생 시 즉시 중단
set -e

echo "🚀 Docker 설치를 시작합니다..."

# 1. 시스템 업데이트 및 필수 패키지 설치
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg

# 2. Docker 공식 GPG 키 등록
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 3. Docker 저장소(Repository) 추가
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Docker 엔진 설치
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 5. 사용자 권한 설정 (sudo 없이 docker 실행 가능하게)
# 주의: 이 설정은 로그아웃 후 다시 로그인해야 적용됩니다.
sudo usermod -aG docker $USER

# 6. 서비스 활성화 및 시작
sudo systemctl enable docker
sudo systemctl restart docker

echo "✅ Docker 설치가 완료되었습니다!"
echo "💡 'newgrp docker' 명령어를 입력하거나 재접속하면 sudo 없이 사용 가능합니다."
