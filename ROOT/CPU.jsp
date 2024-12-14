<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>String Concatenation Example</title>
</head>
<body>
    <h1>String Concatenation Example</h1>
    
    <%
        int iterations = 100000;
        String result = "";

        
        long startTime = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++) {
            result += " " + i;
        }
        long endTime = System.currentTimeMillis();
        out.println("Inefficient concatenation took " + (endTime - startTime) + " milliseconds<br>");

        
        StringBuilder stringBuilderResult = new StringBuilder();
        startTime = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++) {
            stringBuilderResult.append(" ").append(i);
        }
        endTime = System.currentTimeMillis();
        out.println("Efficient concatenation took " + (endTime - startTime) + " milliseconds");
    %>
    </body>
    </html>
    


