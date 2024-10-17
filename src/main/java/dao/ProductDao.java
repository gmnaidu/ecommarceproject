package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Product;

public class ProductDao {

	
	private SessionFactory factory;
	
	
	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// save products to db
	public Boolean saveProducts(Product product) {
		
		Boolean f=false;
		
		try {
			
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			int productId = (int)session.save(product);
			tx.commit();
			session.close();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		return f;
		
	}
	
	
	// retrive all products
	public List<Product> getListOfProducts(){
		
		Session openSession = this.factory.openSession();
		Query query = openSession.createQuery("from Product");
		List<Product> list = query.list();
		
		
		return list;
	}
	
	  // retrive  products by categoryId
		public List<Product> getListOfProductsByCatId(int cId){
			
			Session openSession = this.factory.openSession();
			Query query = openSession.createQuery("from Product as p where p.category.categortId =: id");
			query.setParameter("id", cId);
			List<Product> list = query.list();
			return list;
		}
	
	
	
}
