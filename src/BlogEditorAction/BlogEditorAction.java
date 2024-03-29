package BlogEditorAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;


import com.opensymphony.xwork2.ActionSupport;

import dao.BlogEditorDao;
import po.Blog;

public class BlogEditorAction extends ActionSupport implements RequestAware{

	private static final long serialVersionUID = -7643470039069331541L;
	private String name;
	private String editor;
	
	private Map<String,Object> request;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String demo() throws Exception{
		
		request.put("name", name);
		request.put("editor", editor);
		BlogEditorDao ds = new BlogEditorDao();
		Blog b = new Blog();
		b.setBlogName(name);
		b.setDate((Date)(new Timestamp(System.currentTimeMillis())));
		b.setText(editor);
		ds.saveBlog(b);
		return SUCCESS;
	}
	
	
	public String upload() throws Exception{
		
		HttpServletResponse response = ServletActionContext.getResponse();    
        response.setCharacterEncoding("UTF-8");    
        PrintWriter out = response.getWriter();  
		
		
		String realPath=ServletActionContext.getServletContext().getRealPath("/images");
		File file = new File(realPath);
		
		// CKEditor提交的很重要的一个参数    
		String callback = ServletActionContext.getRequest().getParameter("CKEditorFuncNum"); 
		request.put("callback", callback);
		
		FileOutputStream fout=
                new FileOutputStream(new File(file,getUploadFileName()));
		
		FileInputStream in=new FileInputStream(getUpload());
		
		
		byte[] buffer=new byte[1024];
        int len=0;
        while((len=in.read(buffer))>0)
            fout.write(buffer,0,len);
        
        //一定要在流关闭之前写下面三句话，否则图片显示不出来，也不报错
        out.println("<script type=\"text/javascript\">");    
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + ServletActionContext.getRequest().getContextPath() + "/images/" + uploadFileName + "','')");    
        out.println("</script>");
        
        out.close();
        in.close();
		
		return SUCCESS;
	}


	
}
