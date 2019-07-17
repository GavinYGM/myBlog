package BlogEditorAction;

import dao.BlogEditorDao;
import dao.MessageDao;
import po.Blog;

public class delectAction {
	BlogEditorDao bDao=new BlogEditorDao();
	Blog blog;
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public Blog getBlog() {
		return blog;
	}
	public String delete() {
        bDao.delectBlog(blog.getBlogName());
        MessageDao mDao=new MessageDao();
        
        mDao.delMessageByBlog(blog.getBlogName());
        System.out.println("ÎÒÒªÉ¾³ýÆÀÂÛ"+blog.getBlogName());
        return "list";
    }
}
