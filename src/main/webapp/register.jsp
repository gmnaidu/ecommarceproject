<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
  
  <%@include file="components/common_css_js.jsp" %>

</head>
<body>

  <%@include file="components/navbar.jsp" %>
  
   <div class="container-fluid">
   
       <div class="row mt-5">
  
     <div class="col-md-4 offset-md-4">
     
          
     
        <div class="card">
        
           <div class="card-body px-5">
           
           <%@include file="components/message.jsp" %>
           
           <div class="text-center">
              <img style="width: 75px; height: 75px"  src="img/default.jpg">
           </div>
           
           
           
           <h3 class="text-center my-2">Sign up here !!</h3>
                
        <form action="RegisterServlet" method="post">
           <div class="form-group">
		    <label for="name">User Name</label>
		    <input  name="user_name" type="text" class="form-control" id="name"  placeholder="Enter here">
		   </div>
		   
		   <div class="form-group">
		    <label for="email">User Email</label>
		    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here">
		   </div>
		   
		   <div class="form-group">
		    <label for="password">User Password</label>
		    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here">
		   </div>
		   
		   <div class="form-group">
		    <label for="phone">User Phone</label>
		    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here">
		   </div>
		   
		   <div class="form-group">
		    <label for="address">User Address</label>
		    <textarea name="user_address" style="height: 100px;" class="form-control" placeholder="Enter Address here! "></textarea>
		   </div>
		   
		   
		   <div class="container text-center">
		      <button class="btn btn-outline-success">Register</button>
              <button type="button" class="btn btn-outline-warning" onclick="this.form.reset();">Reset</button>		      
		   </div>
		   
		  
        </form>
              
           </div>
        </div>
        
     </div>
     
  </div>
  
   </div>

   

</body>
</html>