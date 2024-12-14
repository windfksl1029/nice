<%@ page language="java" %>
<%@ page import="java.util.ArrayList" %>

<%

  ArrayList<String> objectList = (ArrayList<String>) session.getAttribute("objectList");

 
  if (objectList == null) {
    objectList = new ArrayList<String>();
    session.setAttribute("objectList", objectList);
  }

 
  int numObjectsToAdd = 50;
  for (int i = 1; i <= numObjectsToAdd; i++) {
    objectList.add("New Object " + i);
  }


  int maxListSize = 100; 
  if (objectList.size() > maxListSize) {
   
    int numObjectsToRemove = objectList.size() - maxListSize;
    objectList.subList(0, numObjectsToRemove).clear();
  } 
  out.println("Total Objects: " + objectList.size());
%>
