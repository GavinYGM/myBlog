package BlogEditorAction;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dao.BlogEditorDao;
import dao.MessageDao;
import po.Blog;

public class updateAction {
	BlogEditorDao bDao=new BlogEditorDao();
	Blog blog;
	String name;
	String editor;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public Blog getBlog() {
		return blog;
	}
	public String update1() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		blog=new Blog();
		blog.setBlogName((String)session.getAttribute("blogName"));
		blog.setDate(new Date());
		blog.setText(editor);
        bDao.updBlog(blog);
        return "list";
	}
	public String update() {
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session = ServletActionContext.getRequest().getSession();
        System.out.println("update²©¿ÍÃû£º"+blog.getBlogName());
        session.setAttribute("blogName", blog.getBlogName());
        return "list";
	}
}
