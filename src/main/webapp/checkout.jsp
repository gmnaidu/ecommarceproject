<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <%@include file="components/common_css_js.jsp"%>
</head>
<body>

   <%@include file="components/navbar.jsp"%>
   
   
   <div class="container">
   
      <div class="row mt-5">
   
      <div class="col-md-6">
      <!-- cart -->
         <h3 class="text-center">Your Items</h3>
	      <div class="card">
	         <div class="card-body">
	            <div class="cart-body"></div>
	            
	         </div>
	      </div>
        
        </div>
      
       </div>
   </div>
       
       <div class="col-md-6">
       <!-- form  -->
       
       
       </div>
  
    
    
     <%@include file="components/common_modals.jsp" %>
</body>
</html>