TARGET_URL="https://www.naver.com"
INTERVAL=0.1 # 요청 간격 (초 단위)
CPU_THREADS=4 # CPU 부하를 발생시킬 스레드 수

echo "Starting traffic generation to $TARGET_URL with interval $INTERVAL seconds"
echo "Generating CPU load with $CPU_THREADS threads"

# CPU 부하를 발생시키는 함수
generate_cpu_load() {
  while true; do
    # CPU 부하를 발생시키는 계산 작업
    for i in {1..100000}; do
      : $((i * i))
    done
  done
}

# CPU 부하를 백그라운드에서 발생시키는 스레드 생성
for ((i=1; i<=CPU_THREADS; i++)); do
  generate_cpu_load &
done

# curl 요청
while true; do
  curl -s -o /dev/null -w "Response: %{http_code}\n" $TARGET_URL
  sleep $INTERVAL
done


