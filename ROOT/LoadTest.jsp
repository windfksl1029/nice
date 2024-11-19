<%@ page import="java.net.HttpURLConnection, java.net.URL, java.io.OutputStream, java.util.concurrent.ExecutorService, java.util.concurrent.Executors" %>
<%
    // CPU 부하를 발생시키는 스레드 수 (조정 가능)
    int cpuLoadThreads = 4;

    // 트래픽 부하를 발생시킬 대상 URL (대상 Pod의 URL을 설정)
    String targetUrl = "http://route1-app.apps.ocp.komsco.co.kr/";

    // HTTP 요청을 반복적으로 보내기 위한 ExecutorService
    ExecutorService trafficExecutor = Executors.newFixedThreadPool(4); // 4개의 스레드로 트래픽 생성

    // 트래픽 부하 생성
    for (int i = 0; i < 10; i++) { // 반복 횟수는 필요에 따라 조정
        trafficExecutor.execute(() -> {
            try {
                URL url = new URL(targetUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setDoOutput(true);

                // 요청을 전송
                int responseCode = conn.getResponseCode();
                out.println("Traffic Sent: Response Code - " + responseCode + "<br/>");
                conn.disconnect();
            } catch (Exception e) {
                out.println("Error Sending Traffic: " + e.getMessage() + "<br/>");
            }
        });
    }

    // CPU 부하를 발생시키기 위한 스레드
    for (int i = 0; i < cpuLoadThreads; i++) {
        new Thread(() -> {
            while (true) {
                // 계산 작업으로 CPU 부하 발생
                double load = 0.0;
                for (int j = 0; j < 1000000; j++) {
                    load += Math.sqrt(j);
                }
            }
        }).start();
    }

    out.println("Traffic and CPU Load started. Check your metrics.<br/>");
%>
