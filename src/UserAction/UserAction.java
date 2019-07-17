package UserAction;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;
import po.User;

public class UserAction extends ActionSupport{
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
	public String add() {
    	user.setRights(2);
 		uDao.add(user);
 		return "list";
	}
	public String alter() {
		User u=uDao.getUser(user.getName());
		System.out.println(u.getName());
		if (u.getName().equals("ygm123")) {
			return "error";
		}else {
			u.setRights(3);
			uDao.update(u);
			return "alter";
		}
	}	
}
