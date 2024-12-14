<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
    <h1>Database Connection Test</h1>

   
    <% 
        String jdbcUrl = "jdbc:oracle:thin:@192.168.219.108:1521:xe";
        String username = "hr";
        String password = "hr";

        Connection connection = null;
        String message = "";

        try {
   
            Class.forName("oracle.jdbc.driver.OracleDriver");

   
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            message = "Database connection successful!";
        } catch (ClassNotFoundException e) {
            message = "Oracle JDBC Driver not found!";
            e.printStackTrace();
        } catch (SQLException e) {
            message = "Database connection failed!";
            e.printStackTrace();
        } finally {
   
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    
        <p><%= message %></p>
       </body>
  </html>
