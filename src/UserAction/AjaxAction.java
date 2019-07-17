package UserAction;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dao.UserDAO;
import po.User;

public class AjaxAction {
	private User user;
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	public String ajax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse() ;
		response.setCharacterEncoding("utf-8") ;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
	    String checkCode2 = (String)session.getAttribute("checkCode");
		String name=request.getParameter("name");
		String code=request.getParameter("code");
		int type=Integer.parseInt(request.getParameter("type"));
		UserDAO uDao=new UserDAO();
		User u=uDao.getUser(name);
		System.out.println(name);
		if (type==1) {
			if (u!=null) {
				response.getWriter().print("该用户已存在！！！") ;
			}else if (name=="") {
				response.getWriter().print("用户名不能为空！！！") ;
			}else if (help(name)) {
				response.getWriter().print("用户名必须以字母开头，后跟字母或数字，长度至少6位") ;
			}else {
				response.getWriter().print("") ;
			}
		}else if (type==2) {
			if (code=="") {
				response.getWriter().print("验证码不能为空！！！") ;
			}else if (!code.equals(checkCode2)) {
				response.getWriter().print("验证码错误！！！") ;
			}else {
				response.getWriter().print("") ;
			}
		}
		
		return null ;
	}
	public boolean help(String name) {
		if (!Character.isAlphabetic(name.charAt(0))) {
			return true;
		}else if (name.length()<6) {
			return true;
		}else{
			for (int i = 1; i < name.length()-1; i++) {
				if (!(Character.isAlphabetic(name.charAt(i))||Character.isDigit(name.charAt(i)))) {
					return true;
				}
			}
		}
		return false;
	}
}
