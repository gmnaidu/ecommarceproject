<%@page import="entities.User"%>
<%


    User user= (User)session.getAttribute("current-user");
    

     if(user == null){
    	 
    	 session.setAttribute("message", "You are Not Logged in, Login First !");
    	 response.sendRedirect("login.jsp");
    	 return;
     }

%>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycart - NormalUser</title>
</head>
<body>
    <h1> This is normal user panel</h1>
</body>
</html>