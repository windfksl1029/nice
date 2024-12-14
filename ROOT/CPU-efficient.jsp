<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>String Concatenation Example</title>
</head>
<body>
    <h1>String Concatenation Example (Efficient Version)</h1>
    
    <%
        int iterations = 9000000;
        
        StringBuilder stringBuilderResult = new StringBuilder();
        long startTime = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++) {
            stringBuilderResult.append(" ").append(i);
        }
        long endTime = System.currentTimeMillis();
        out.println("Efficient concatenation took " + (endTime - startTime) + " milliseconds");
    %>
    </body>
    </html>
    
