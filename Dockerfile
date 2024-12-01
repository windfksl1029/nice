FROM ubuntu:latest

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y bash

# 스크립트 복사 및 실행 권한 부여
COPY tra.sh /tra.sh
RUN chmod +x /tra.sh

# 실행
ENTRYPOINT ["sh", "/tra.sh"]
