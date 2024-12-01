FROM ubuntu:latest

# bash 설치
USER root
RUN yum update -y && yum install -y bash

# 작업 디렉토리 설정
WORKDIR /opt/app

# 스크립트 복사 및 실행 권한 부여
COPY tra.sh /opt/app/tra.sh
RUN chmod +x /opt/app/tra.sh

# 기본 셸을 bash로 설정
SHELL ["/bin/bash", "-c"]

# bash로 스크립트 실행
ENTRYPOINT ["/bin/bash", "/opt/app/tra.sh"]
