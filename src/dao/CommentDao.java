package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import po.Blog;
import po.Comment;
import po.Message;
import po.User;


public class CommentDao
{
	private  Session session=null;
	private Transaction tx=null;
	public void add(Comment comment) {		
        List<Comment> comments = new ArrayList();
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.save(comment);
        s.getTransaction().commit();
        s.close();
        sf.close();
    }
	public List<Comment> selectAllList(int pageNo,int pageSize)
	{//分页查询		
		List<Comment> list=null;				
		SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
		String hql="from Comment order by date desc";		
		Query query=s.createQuery(hql);	
		query.setFirstResult((pageNo-1)*pageSize);	
		query.setMaxResults(pageSize);		
		list=query.list();	
        s.close();
        sf.close();
		return list;
		}	
	public int getPageCount(int pageSize)
	{//获得总页数	
		String hql="select count(id) from Comment";	
		int count=0;	
		int pageCount=0;		
		SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
		Query query=s.createQuery(hql);	
		long temp=(Long)query.uniqueResult();		
		count=(int)temp;
		s.close();
        sf.close();
		if(count%pageSize==0){		
			pageCount=count/pageSize;	
		}else{			
			pageCount=count/pageSize+1;	
		}		
		return pageCount;	
		}  	 
	public void delComment(int id){
		List<User> result = new ArrayList();		 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        Comment comment = (Comment) s.get(Comment.class, id);
        s.delete(comment);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public Comment getLatestComment() {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Comment where date = (select max(date) from Comment)";
        Query q = s.createQuery(hql);
        Comment b = (Comment)q.uniqueResult();
        s.close();
        sf.close();
        return b;
	}
}