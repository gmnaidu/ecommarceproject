
<%@page import="helper.TestHelper"%>
<%@page import="entities.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mycart - Home</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>


	<%
	
	  String cat= request.getParameter("category");
	//  out.println(cat);
	ProductDao pdao = new ProductDao(FactoryProvider.getSessionFactory());
	
	List<Product> products=null;
	
	if(cat== null ||  cat.trim().equals("all")){
		 products = pdao.getListOfProducts();
	}else{
		int cId= Integer.parseInt(cat);
		products= pdao.getListOfProductsByCatId(cId);
	}

	// retriving category
	CategoryDao cDao = new CategoryDao(FactoryProvider.getSessionFactory());
	List<Category> categoryList = cDao.categoryList();
	%>

   <div class="container-fluid">
	<div class="row mt-3 mx-2">
		<div class="col-md-2">


			<div class="list-group">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					All Products </a>
			</div>

			<%
			  for (Category c : categoryList) {
       		%>

			<a  href="index.jsp?category=<%=c.getCategortId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


			<%
			   }
			%>

		</div>

		<div class="col-md-10">


			<div class="row mt-4">

				<div class="col-md-12">


					<div class="card-columns">
					
					<%
					
					  for(Product p: products){
						  
				    %>
				    
				       <div class="card product-card">
				           
				           <div class="container text-center">
				              <img class="card-img-top m-2" style="max-height: 250px; max-width: 100%" width="auto" src="${pageContext.request.contextPath}/img/Products/<%=p.getpPhoto() %>" alt="Card image cap">
				           </div>
                           
							<div class="card-body">
								<h5 class="card-title"><%= p.getpName() %></h5>
								<p class="card-text"><%= TestHelper.get10Words(p.getpDesc()) %></p>
							</div>
							
							<div class="card-footer text-center">
							   <button class="btn custum-bg text-white" onclick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName() %>',<%=p.finalPriceAfterDiscount()%>)">Add To Cart</button>
							   <button class="btn btn-outline-warning">&#8377;<%=p.finalPriceAfterDiscount() %>/-  <span class="text-secondary discount-label">  &#8377;  <%= p.getpPrice() %>/- <%=p.getpDiscount() %>% off</span></button>
							
							</div>
							
						</div>
					<% 
					  }
					
					  if(products.size()==0){
						  out.println("<h3>No Items In this cart</h3>");
					  }
					%>

						



					</div>

				</div>

			</div>


		</div>

	</div>
	
	</div>


      <%@include file="components/common_modals.jsp" %>


</body>
</html>