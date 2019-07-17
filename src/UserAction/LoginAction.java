package UserAction;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dao.UserDAO;
import po.User;

public class LoginAction {
	User user;
	String checkCode;
	
	UserDAO uDao=new UserDAO();
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return checkCode;
	}
	
	public String login() {
	      HttpSession session = ServletActionContext.getRequest().getSession();
	      session.setAttribute("userName", user.getName());
	      System.out.println((String)session.getAttribute("userName"));
	      String checkCode2 = (String)session.getAttribute("checkCode");
	      User u=uDao.getUser(user.getName());
	      if (u==null) {
			return "loginError";
	      }else {
	    	  if(!checkCode.equals(checkCode2))
		      {
		          return "logCodeError";
		      }else {
		    	  if (u.getName().equals(user.getName())&&u.getPassword().equals(user.getPassword())) {
		    		  System.out.println(u.getRights());
		  				if (u.getRights()==1) {
							return "loginAdmin";
						}else {
							return "loginCom";
						}
		  			}else {
		  				return "loginError";
		  			}
		 	}
		}
	}
}
