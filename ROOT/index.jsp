<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>Session Clustering Test</TITLE>
</head>
<body>
<h1>Session Clustering Test</h1>
<%
    Integer ival = (Integer)session.getAttribute("_session_counter");
 
    if(ival==null) {
        ival = new Integer(1);
    }
    else {
        ival = new Integer(ival.intValue() + 1);
    }
    session.setAttribute("_session_counter", ival);
    System.out.println("here~~~~");
%>
Session Counter = [<b> <%= ival %> </b>]<p>
<a href="./sample.jsp">[Reload]</a>
<p>
Current Session ID : <%= request.getRequestedSessionId() %><br />
   <h1>CPU Load Tester</h1>
    <button id="startButton" onclick="startCpuRequests()">Start CPU Requests</button>
    <button id="stopButton" onclick="stopCpuRequests()" disabled>Stop CPU Requests</button>
    <p>Click "Start CPU Requests" to begin sending requests to 1cpu.jsp every 2 seconds.</p>

    <script>
        let intervalId;

        function startCpuRequests() {
            // Disable the start button and enable the stop button
            document.getElementById('startButton').disabled = true;
            document.getElementById('stopButton').disabled = false;
            
            // Start sending requests every 2 seconds
            intervalId = setInterval(function() {
                fetch('1cpu.jsp')
                    .then(response => response.text())
                    .then(data => console.log('Response from 1cpu.jsp:', data))
                    .catch(error => console.error('Error fetching 1cpu.jsp:', error));
            }, 1000);
        }

        function stopCpuRequests() {
            // Clear the interval to stop sending requests
            clearInterval(intervalId);
            
            // Enable the start button and disable the stop button
            document.getElementById('startButton').disabled = false;
            document.getElementById('stopButton').disabled = true;
        }
    </script>

</body>
</html>
