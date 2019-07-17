package po;

public class User {
	int id;
	String name;
	String password;
	int rights;
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public void setRights(int rights) {
		this.rights = rights;
	}
	public int getRights() {
		return rights;
	}
	
}
