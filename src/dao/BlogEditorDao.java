package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import po.Blog;

public class BlogEditorDao {
	public void saveBlog(Blog b) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.save(b);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void delBlog(Blog b) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.delete(b);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void delectBlog(String name) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        Blog b = new Blog();
        b.setBlogName(name);
        s.beginTransaction();
        s.delete(b);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public void updBlog(Blog b) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        s.update(b);
        s.getTransaction().commit();
        s.close();
        sf.close();
	}
	public List<Blog> getBlogs() {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Blog order by date desc";
        Query q = s.createQuery(hql);
        List<Blog> l = q.list();
        s.close();
        sf.close();
        return l;
	}
	public Blog getLatestBlog() {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Blog where date = (select max(date) from Blog)";
        Query q = s.createQuery(hql);
        Blog b = (Blog)q.uniqueResult();
        s.close();
        sf.close();
        return b;
	}
	public Blog getBlog(String name) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
        String hql = "from Blog b where b.blogName = ?";
        Query q = s.createQuery(hql);
        q.setParameter(0, name);
        Blog b = (Blog)q.uniqueResult();
        s.close();
        sf.close();
        return b;
	}
	public List<Blog> searchBlog(String name) {
        SessionFactory sf = new Configuration().configure()
                .buildSessionFactory();
        Session s = sf.openSession();
//        String hql = "from Blog b where b.blogName = ?";
//        Query q = s.createQuery(hql);
        Query q =s.createQuery("from  Blog b where b.blogName like ? order by date desc");
        q.setString(0, "%"+name+"%");
        List<Blog> l = q.list();
        s.close();
        sf.close();
        return l;
	}
}
