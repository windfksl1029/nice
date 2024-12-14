<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>TEST PAGE1</TITLE>
</head>
<body>
<h1>TEST PAGE1</h1>
<h2>session timeout 5min</h2>
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
<a href="./">[Reload]</a><br>
<a href="./delay.jsp">[Delay]</a><br>
<a href="./fileselect.jsp">[Upload]</a><br>
<a href="./login.jsp">[Login]</a><br>
<a href="./ExternalCall.jsp">[ExternalCall]</a><br>
<a href="./dbcptest.jsp">[DBCP]</a><br>
<a href="./CPU-Inefficient.jsp">[CPU1]</a><br>
<a href="./CPU-efficient.jsp">[CPU2]</a><br>
<p>
Current Session ID : <%= request.getRequestedSessionId() %><br />
</body>
</html>
