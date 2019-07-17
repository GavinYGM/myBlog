package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import po.*;

public class AdminDao {
/*	public void add(Admin admin) {
        List<Admin> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
 
        s.save(admin);
 
        s.getTransaction().commit();
        s.close();
        sf.close();
    }*/
 
    public Admin get(int id) {
        Admin result = null;
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
 
        result = (Admin) s.get(Admin.class, id);
 
        s.close();
        sf.close();
        return result;
    }
    public Admin getAdmin(String name) {
        Admin result = null;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Admin c where c.name =?";
        Query q= s.createQuery(hql);
        q.setParameter(0, name);
        result =(Admin)q.uniqueResult();
        s.close();
        sf.close();
        return result;
    }
/*    public void delete(int id) {
        List<Admin> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
 
        Admin admin = (Admin) s.get(Admin.class, id);
 
        s.delete(admin);
 
        s.getTransaction().commit();
        s.close();
        sf.close();
    }*/
 
    public void update(Admin admin) { 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.update(admin);
        s.getTransaction().commit();
        s.close();
        sf.close();
    }

    public List<Admin> listAdmin() {
        List<Admin> result = new ArrayList();
 
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
 
        Query q = s.createQuery("from Admin p");
 
        result = q.list();
 
        s.close();
        sf.close();
        return result;
    }
}
