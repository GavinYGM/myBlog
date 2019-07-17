package po;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.enterprise.inject.New;

public class Comment {
	int id;
	String user;
	String content;
	Date date;
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	//User user=new User();
	//String nameString=user.getName();
	public void setUser(String nameString) {
		this.user = nameString;
	}
	public String getUser() {
		
		return user;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getDate() {
		return date;
	}
	
}
