<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL" %>
<%
 
    String urlString = "https://www.incheon.go.kr/index";

    try {
 
        URL url = new URL(urlString);

 
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

 
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();


        if (responseCode == HttpURLConnection.HTTP_OK) {
            StringBuilder responseData = new StringBuilder();  // Change variable name to avoid conflict


            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            
            String line;

            while ((line = reader.readLine()) != null) {
                responseData.append(line);
            }


            reader.close();


            out.println("<p>Response from " + urlString + ":</p>");
            out.println("<pre>" + responseData.toString() + "</pre>");
        } else {

            out.println("<p>Error: " + responseCode + "</p>");
        }


        connection.disconnect();
    } catch (Exception e) {

        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
