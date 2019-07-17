package MessageAction;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import dao.MessageDao;
import dao.UserDAO;
import po.Message;
import po.User;

public class MessageAction {
	private Message message;
	HttpSession session = ServletActionContext.getRequest().getSession();
	String userName=(String)session.getAttribute("userName");
	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	public String save() {
		if (userName==null) {
			return "login";
		}else {
			UserDAO uDao=new UserDAO();
			User user=uDao.getUser(userName);
			if (user.getRights()==3) {
				return "login1";
			}else {
				MessageDao mdao = new MessageDao();
				message.setUserName(userName);
				message.setDate(new Date());
				session.setAttribute("blogName", message.getBlogName());
				mdao.saveMessage(message);
				return "save";
			}	
		}
		
	}
	public String delete() {
		MessageDao mdao = new MessageDao();
		mdao.delMessage(message.getId());
		return "list";
	}
}
