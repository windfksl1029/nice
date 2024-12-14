<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>String Concatenation Example</title>
</head>
<body>
    <h1>String Concatenation Example (Inefficient Version)</h1>
    
    <%
        int iterations = 30000;
        String result = "";
        
        long startTime = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++) {
            result += " " + i;
        }
        long endTime = System.currentTimeMillis();
        out.println("Inefficient concatenation took " + (endTime - startTime) + " milliseconds");
    %>
    </body>
    </html>
    
