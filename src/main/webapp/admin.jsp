
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.User"%>
<%@page import="java.util.List" %>
<%@page import="entities.Category"%>

<%
User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("message", "You are Not Logged in, Login First !");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! Do not Access This page?");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycart - Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
	<%@include file="components/navbar.jsp"%>




	<div class="container admin">

      <!-- adding msg to form  -->
      <div class="container-fluid mt-3">
          <%@include file="components/message.jsp" %>
      </div>
     
		<!-- first column  -->
		<div class="row mt-3">
			<!-- first col -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 150px;" class="img-fluid rounded-circle"
								src="img/team.png">
						</div>

						<h1>2342</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>

				</div>

			</div>
			<!-- second col -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 150px;" class="img-fluid rounded-circle"
								src="img/categories.png">
						</div>

						<h1>23432</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>

				</div>

			</div>
			<!-- third col  -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 150px;" class="img-fluid rounded-circle"
								src="img/shopping-bag.png">
						</div>

						<h1>246</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>

				</div>

			</div>


		</div>




		<!-- second row -->

		<div class="row mt-3">
			<!-- first col -->
			<div class="col-md-6">

				<div class="card" data-toggle="modal" data-target="#add-category">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 150px;" class="img-fluid rounded-circle"
								src="img/options.png">
						</div>

						<h1>23432</h1>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>

				</div>
			</div>
			<!--  second col -->
			<div class="col-md-6">

				<div class="card" data-toggle="modal" data-target="#add-products">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 150px;" class="img-fluid rounded-circle"
								src="img/plus.png">
						</div>

						<h1>23432</h1>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>

				</div>
			</div>

		</div>




	</div>


	<!--  start add-category model -->

	<!-- Modal -->
	<div class="modal fade" id="add-category" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custum-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				   <form action="ProductProcessServlet" method="post">
				   
				   <input type="hidden" name="operation" value="addcategory">
				        
				   
				      <div class="form-group">
				        
				          <input class="form-control" type="text" name="categoryTitle" placeholder="Enter Title here" required>
				      </div>
				      
				       <div class="form-group">
				         
				          <textarea style="height: 300px" class="form-control"   name="categoryDescription"  rows="" cols="" placeholder="Enter Category Description here !" required></textarea>
				      </div>
				      
				      
				      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Category</button> 	
                          
                          <button type="button" class="btn btn-secondary"
						   data-dismiss="modal">Close</button>			         
				      </div>
				   
				   
				   
				   
				   </form>
				
				
				
				
				
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- end add-category model   -->
	
	
	
	
	<!--  start add-products model -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="add-products" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custum-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				   <form action="ProductProcessServlet" method="post" enctype="multipart/form-data">
				   
				    <input type="hidden" name="operation" value="addproduct">
				     
				   
				      <div class="form-group">
				          <input class="form-control" type="text" name="pName" placeholder="Enter Product Name" required>
				      </div>
				      
				      <div class="form-group">
				          <textarea style="height: 100px" class="form-control"   name="pDesc"   placeholder="Enter Product Description" required></textarea>
				      </div>
				      
				       
				      
				       <div class="form-group">
				          <input class="form-control" type="number" name="pPrice" placeholder="Enter product Price" required>
				      </div>
				      
				      <div class="form-group">
				          <input class="form-control" type="number" name="pDiscount" placeholder="Enter Product Discount price" required>
				      </div>
				      
				      <div class="form-group">
				          <input class="form-control" type="number" name="pQuantity" placeholder="Enter Product quantity" required>
				      </div>
				      
				       
				       <!-- retrive list of category products  -->
				       
				       <%
				          
				       CategoryDao cdao= new CategoryDao(FactoryProvider.getSessionFactory());
				       List<Category>  clist= cdao.categoryList();
				       
				       
				       %>
				      
				      
				      
				      <!--  product category  -->
				      <div class="form-group">
				        <select name="catId" class="form-control">
				        
				            <%
				                for(Category c : clist){
				            %>  	
				                	
				            	<option  value="<%= c.getCategortId() %>"> <%= c.getCategoryTitle() %> </option>
				            	
				            <% } %>
				           
				          
				        </select>
				      </div>
				       
				      <!-- product picture -->
				      
				      <div class="form-group">
				          <label>Select Picture of the Product</label>
				          <input class="form-control" type="file" name="pPhoto" placeholder="add Photo here" required>
				      </div>
				      
				       
				      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Products</button> 	
                          
                          <button type="button" class="btn btn-secondary"
						   data-dismiss="modal">Close</button>			         
				      </div>
				   
				   
				   
				   
				   </form>
				
				
				
				
				
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- end add-products model -->
	
	
</body>
</html>















