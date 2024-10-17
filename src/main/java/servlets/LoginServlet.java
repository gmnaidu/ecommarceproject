package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import dao.UserDao;
import entities.User;
import helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	   
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// Accessing userDao to retrive the User data
		UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
		User user = userDao.getUserDataByEmailandPassword(email, password);
		
		HttpSession session = request.getSession();
		
		
		if(user == null) {
			
			//out.println("<h1>Invalid Details, Try with new one ?</h1>");
			session.setAttribute("message", "Invalid Details, Try with another One?");
		    response.sendRedirect("login.jsp");
		    return;
				
		}else {
			//out.println("<h1>Welcome "+ user.getUserName()+"</h1>");

			  session.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				// admin :- admin.jsp
				response.sendRedirect("admin.jsp");
				
			}else if(user.getUserType().equals("normal")) {
				// normal :- normal.jsp
				response.sendRedirect("normal.jsp");
			}else {
				out.println("<h1>You are not belongs to any UserType</h1>");
			}
				
			
			
		}
		
		
	}

}
