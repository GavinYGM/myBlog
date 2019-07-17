package UserAction;

import java.util.List;

import dao.*;
import po.*;

public class AdminAction {
	AdminDao aDao = new AdminDao();
    Admin admin;
    List<Admin> admins;
     
    public List<Admin> getAdmins() {
        return admins;
    }
 
    public void setAdmins(List<Admin> admins) {
        this.admins = admins;
    }
 
    public Admin getAdmin() {
        return admin;
    }
 
    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
 
/*    public String add() {
        aDao.add(admin);
        return "list";
    }*/
    public String edit() {
        admin =aDao.get(admin.getId());
        return "edit";
    }
/*    public String delete() {
        aDao.delete(admin.getId());
        return "list";
    }*/
    public String update() {
        aDao.update(admin);
        return "list";
    }
    public String list() {
        admins = aDao.listAdmin();
        return "listJsp";
    }
}
