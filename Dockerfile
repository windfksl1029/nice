# JBoss WildFly 이미지 사용
FROM jboss/wildfly:latest

# tra.sh 복사
COPY tra.sh /tra.sh

# 실행 권한 부여
RUN chmod +x /tra.sh

# tra.sh 실행
ENTRYPOINT ["sh", "/tra.sh"]
