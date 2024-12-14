<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.directory.InitialDirContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		Context context = new InitialContext(null);
		DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		Connection conn = dataSource.getConnection();
		
		String sql = "select sysdate from dual";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		
		Date date = null;
		
		if(rs.next()){
			date = rs.getDate(1);
		}
	%>
	<%=date %>
	</body>
	</html>
