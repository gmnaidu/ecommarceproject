package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		
		this.factory = factory;
	}
	
	
	public User getUserDataByEmailandPassword(String email, String password) {
		
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		User user=null;
		
		try {
			
			Session session = factory.openSession();
			String query ="from User where userEmail =: e";
			Query<?> q = session.createQuery(query);
			q.setParameter("e", email);
			user = (User)q.uniqueResult();
			session.close();
			
			if(user != null && bCryptPasswordEncoder.matches(password, user.getUserPassword())){
			
			   return user;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	  return null;	
	}
	
}
