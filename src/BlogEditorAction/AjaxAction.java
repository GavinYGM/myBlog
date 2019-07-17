package BlogEditorAction;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dao.BlogEditorDao;
import po.Blog;

public class AjaxAction {
	
	public String ajax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse() ;
		response.setCharacterEncoding("utf-8") ;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		String name=request.getParameter("name");
		System.out.println(name);
		if(name.equals("")) {
			response.getWriter().print("标题不能为空！！！");
		}
		BlogEditorDao bd = new BlogEditorDao(); 
 		Blog b =bd.getBlog(name);
		if (b==null) {
			response.getWriter().print("");
		}else{
			response.getWriter().print("该博客名已存在！！！");
		}
		
		return null ;
	}
}

