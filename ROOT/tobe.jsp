<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>Session Clustering Test</TITLE>
</head>
<body>
<h1>uniuniuni</h1>
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
</body>
</html>
