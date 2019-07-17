package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import po.Message;
import po.User;

public class MessageDao {
	public void saveMessage(Message m) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.save(m);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void updMessage(Message m) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.update(m);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void delMessageByUser(String userName) {
		SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "delete Message where userName = ?";
        Query q = s.createQuery(hql);
        q.setParameter(0, userName);
        q.executeUpdate();
        s.close();
        sf.close();
	}
	public void delMessageByBlog(String blogName) {
		SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        String hql = "delete Message where userName = ?";
        Query q = s.createQuery(hql);
        q.setParameter(0, blogName);
        q.executeUpdate();
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void delMessage(String userName,String blogName) {
		SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "delete Message m where m.userName = ?,m.blogName=?";
        Query q = s.createQuery(hql);
        q.setParameter(0, userName);
        q.setParameter(1, blogName);
        q.executeUpdate();
        s.close();
        sf.close();
	}
	public void delMessage(int id){
		List<User> result = new ArrayList();
		 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
 
        Message message = (Message) s.get(Message.class, id);
 
        s.delete(message);
 
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public List<Message> getMessages() {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Message order by date desc";
        Query q = s.createQuery(hql);
        List<Message> l = q.list();
        s.close();
        sf.close();
        return l;
	}
	public List<Message> getMessagesByUser(String userName) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Message b where b.userName = ?";
        Query q = s.createQuery(hql);
        q.setParameter(0, userName);
        List<Message> b = q.list();
        s.close();
        sf.close();
        return b;
	}
	public List<Message> getMessagesByBlog(String blogName) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Message b where b.blogName = ?  order by date desc";
        Query q = s.createQuery(hql);
        q.setParameter(0, blogName);
        List<Message> b = q.list();
        s.close();
        sf.close();
        return b;
	}
}
