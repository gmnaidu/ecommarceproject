package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;
import helper.FactoryProvider;

@WebServlet("/ProductProcessServlet")
@MultipartConfig
public class ProductProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		
		// checking fields are related to category or products 
		String parameter = request.getParameter("operation");
		
		
		if(parameter.trim().equals("addcategory")) {
			
			String title = request.getParameter("categoryTitle");
			String cateDesc = request.getParameter("categoryDescription");
			
			
			Category cat = new Category();
			cat.setCategoryTitle(title);
			cat.setCategoryDescription(cateDesc);
			
			
			// data store to the db
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
			int cat_id = categoryDao.saveCategory(cat);
			
//			out.println("category saved:  "+cat_id);
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", " category Added successfully. "+cat_id);
			response.sendRedirect("admin.jsp");
			return;
			
			
			
		}else if(parameter.trim().equals("addproduct")) {
			
			
			// retrive data from form
			
			String pName = request.getParameter("pName");
			String pDesc = request.getParameter("pDesc");
			int pPrice =Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity =Integer.parseInt(request.getParameter("pQuantity"));
			int pcatId =Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("pPhoto");
			
			
			Product product = new Product();
			product.setpName(pName);
			product.setpDesc(pDesc);
			product.setpPrice(pPrice);
			product.setpDiscount(pDiscount);
			product.setpQuantity(pQuantity);
			product.setpPhoto(part.getSubmittedFileName());
			
			// retrive Category By id
			CategoryDao cDao= new CategoryDao(FactoryProvider.getSessionFactory());
			Category category= cDao.getCategoryById(pcatId);
			
			product.setCategory(category);
			
			
			// data added to db calling ProductDao
			ProductDao productDao= new ProductDao(FactoryProvider.getSessionFactory());
			productDao.saveProducts(product);
			
			// save image to server
			
			
			try {
				
				String realPath = request.getServletContext().getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(realPath);
				
				FileOutputStream fos = new FileOutputStream(realPath);
				InputStream is = part.getInputStream();
				
				byte[] data= new byte[is.available()];
				
				is.read(data);
				fos.write(data);
				fos.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Save Product Successfully : ");
			
			response.sendRedirect("admin.jsp");
			return;
			
		}
		
		
	}

}
