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
				response.getWriter().print("���û��Ѵ��ڣ�����") ;
			}else if (name=="") {
				response.getWriter().print("�û�������Ϊ�գ�����") ;
			}else if (help(name)) {
				response.getWriter().print("�û�����������ĸ��ͷ�������ĸ�����֣���������6λ") ;
			}else {
				response.getWriter().print("") ;
			}
		}else if (type==2) {
			if (code=="") {
				response.getWriter().print("��֤�벻��Ϊ�գ�����") ;
			}else if (!code.equals(checkCode2)) {
				response.getWriter().print("��֤����󣡣���") ;
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
