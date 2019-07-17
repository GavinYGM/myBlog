
package CommentAction;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.CommentDao;
import dao.MessageDao;
import dao.UserDAO;
import po.Comment;
import po.User;

public class CommentAction extends ActionSupport {
	private Comment comment;	
	private List<Comment> comments;
	private CommentDao commentDao=new CommentDao();
	private int pageNo=1;
	private int pageSize=8;
	private int pageCount;

	HttpSession session = ServletActionContext.getRequest().getSession();
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComments(List<Comment> comments)
	{
		this.comments=comments;
	}
	public int getPageNo()
	{
		return pageNo;
	}
	public void setPageNo(int pageNo)
	{
		this.pageNo=pageNo;
	}
	public int getPageSize() 
	{		
		return pageSize;	
	}	
	public void setPageSize(int pageSize)
	{		
		this.pageSize = pageSize;	
	}	
	public int getPageCount() 
	{		
		return pageCount;	
	}	
	public void setPageCount(int pageCount) 
	{		
		this.pageCount = pageCount;	
	}	
	String username=(String) session.getAttribute("userName");	
	java.util.Date date1=new java.util.Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss");
    String date2 = sdf.format(date1); 
	
    public String add() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (username==null) {
			return "login";
		}else {
			UserDAO uDao=new UserDAO();
			User user=uDao.getUser(username);
			if (user.getRights()==3) {
				return "login1";
			}else {
				comment.setDate(new Date());
		 		commentDao.add(comment);
		 		return "add";
			}
		}
	}
	public String Page()
	{
		HttpServletRequest request = ServletActionContext.getRequest();	
		int pageNo = 1;
		int pageSize=5;
	    String strPageNo = request.getParameter("pageNo"); 
	    if(strPageNo != null)
	    {
	       pageNo = Integer.parseInt(strPageNo); // 把字符串转换成数字
	    }
	    CommentDao commentDao = new CommentDao();
        List<Comment> userlist = commentDao.selectAllList(pageNo,pageSize);
        request.setAttribute("userlist",userlist);
        Integer pageCount = new Integer(commentDao.getPageCount(pageSize));
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
	    return "page";
	}
	public String Page1()
	{
		HttpServletRequest request = ServletActionContext.getRequest();	
		int pageNo = 1;
		int pageSize=5;
	    String strPageNo = request.getParameter("pageNo"); 
	    if(strPageNo != null)
	    {
	       pageNo = Integer.parseInt(strPageNo); // 把字符串转换成数字
	    }
	    CommentDao commentDao = new CommentDao();
        List<Comment> userlist = commentDao.selectAllList(pageNo,pageSize);
        request.setAttribute("userlist",userlist);
        Integer pageCount = new Integer(commentDao.getPageCount(pageSize));
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
	    return "page1";
	}
	
	public String delete() {
		CommentDao cDao=new CommentDao();
		cDao.delComment(comment.getId());
		return "del";
	}
}
