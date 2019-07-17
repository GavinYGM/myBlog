package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import po.User;

public class UserDAO {
	public void add(User user) {
        List<User> result = new ArrayList();
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.save(user);
        s.getTransaction().commit();
        s.close();
        sf.close();
    }
 
    public User getUser(String name) {
        User result = null;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from User c where c.name =?";
        Query q= s.createQuery(hql);
        q.setParameter(0, name);
        result =(User)q.uniqueResult();
        s.close();
        sf.close();
        return result;
    }
 
    public void delete(int id) {
        List<User> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
 
        User user = (User) s.get(User.class, id);
 
        s.delete(user);
 
        s.getTransaction().commit();
        s.close();
        sf.close();
    }
 
    public void update(User user) {
        List<User> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
 
        s.update(user);
 
        s.getTransaction().commit();
        s.close();
        sf.close();
    }
 
    public List<User> listUser() {
        List<User> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
 
        Query q = s.createQuery("from User p");
 
        result = q.list();
 
        s.close();
        sf.close();
        return result;
    }
}
