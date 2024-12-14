<%@ page language="java" %>
<%@ page import="java.util.ArrayList" %>

<%

  ArrayList<String> objectList = (ArrayList<String>) session.getAttribute("objectList");

 
  if (objectList == null) {
    objectList = new ArrayList<String>();
    session.setAttribute("objectList", objectList);
  }

 
  int numObjectsToAdd = 40;
  for (int i = 1; i <= numObjectsToAdd; i++) {
    objectList.add("New Object " + i);
  }
 
  out.println("Total Objects: " + objectList.size());
%>
