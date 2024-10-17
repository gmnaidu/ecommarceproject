package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Category;

public class CategoryDao {

	
	private SessionFactory factory;
	
	
	public CategoryDao(SessionFactory factory) {
		
		this.factory = factory;
	}
	
	
	public int saveCategory(Category cat) {
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		int cat_id = (int)session.save(cat);
		
		tx.commit();
		return cat_id;
	}
	
	
	// retrive all category objects
	public List<Category> categoryList(){
		Session sess = factory.openSession();
		Query query = sess.createQuery("from Category");
		List<Category> list = query.list();
		
		return list;
	}
	
	
	// get single category
	public Category getCategoryById(int cId) {
     
		Category category=null;
		
		try {
			
			Session openSession = this.factory.openSession();
			category= openSession.get(Category.class, cId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return category;
		
	}
	
	
	
}
