TARGET_URL="app-app.apps.ocp.komsco.co.kr"
INTERVAL=0.1 # 요청 간격 (초 단위)
REQUEST_THREADS=4 # 요청을 보내는 스레드 수

echo "Starting traffic generation to $TARGET_URL with interval $INTERVAL seconds"
echo "Generating load with $REQUEST_THREADS threads"

# HTTP 요청을 보내는 함수
send_http_request() {
  while true; do
    curl -s -o /dev/null -w "Response: %{http_code}\n" $TARGET_URL
    sleep $INTERVAL
  done
}

# 백그라운드에서 HTTP 요청을 보내는 스레드 생성
PIDS=()
for ((i=1; i<=REQUEST_THREADS; i++)); do
  send_http_request &
  PIDS+=($!) # 백그라운드 PID 저장
done

# 스크립트 종료 시 백그라운드 프로세스를 종료하는 함수 정의
cleanup() {
  echo "Stopping all traffic generation threads..."
  for PID in "${PIDS[@]}"; do
    kill $PID
  done
}

# SIGINT (Ctrl+C) 시 cleanup 함수 호출
trap cleanup SIGINT

# 스크립트는 계속해서 요청을 보내는 동안 실행됩니다.
wait
