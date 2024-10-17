package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import entities.User;
import helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		    response.setContentType("text/html");
		
		   try {
			   
			   PrintWriter out = response.getWriter();
			   String userName = request.getParameter("user_name");
			   String userEmail = request.getParameter("user_email");
			   String userPassword = request.getParameter("user_password");
			   String userPhone = request.getParameter("user_phone");
			   String userAddress = request.getParameter("user_address");
			   
			   
			   
			  
			   System.out.println("userEmail :"+ userPassword);
			   
			   // Input validation
		        if (userName.isEmpty() &&  userEmail.isEmpty() && userPassword.isEmpty() && userPhone.isEmpty() && userAddress.isEmpty()) {
		            out.println("All fields are required!");
		            return;
		        }
			   
			   
			   // setting up data added to the database
			   
			   BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			   String userEncodePassword = bCryptPasswordEncoder.encode(userPassword);
			   
			   System.out.println("password: "+ userEncodePassword);
			   
			   User user = new User(userName, userEmail, userEncodePassword, userPhone, "default.png", userAddress,"normal");
			   
			   
			   
			   Session session = FactoryProvider.getSessionFactory().openSession();
			   Transaction txn = session.beginTransaction();
			   
			   int userId = (int)session.save(user);
			   
			   txn.commit();
			   session.close();
			   
			   
			   
			   HttpSession httpSession = request.getSession();
			   httpSession.setAttribute("message", "Registration Successful !! userId "+userId);
			   
			   response.sendRedirect("register.jsp");
			   return;
			   
			   
			  
			   
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

}
