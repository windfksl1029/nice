<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("username");
    System.out.println("username: " + username);
    String password = request.getParameter("password");

    String jdbcUrl = "jdbc:oracle:thin:@192.168.219.108:1521:xe";
    String dbUsername = "hr";
    String dbPassword = "hr";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    boolean isAuthenticated = false;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);

        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            isAuthenticated = true;
            System.out.println("Authentication successful for user: " + username);
        } else {
            System.out.println("Authentication failed for user: " + username);
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    if (isAuthenticated) {
        response.sendRedirect("welcome.jsp"); // Redirect to the welcome page on successful login
    } else {
        response.sendRedirect("/"); // Redirect back to the login page on login failure
    }
%>
